'use strict';
// Local server: serves the page and proxies the APIs, since Kalshi refuses browser requests.
const http = require('http');
const fs = require('fs');
const path = require('path');
const { parsePredictions, parseKalshiMarkets } = require('./lib/parse');

const PORT = Number(process.env.PORT) || 5177;
const PAGE = '2026_United_States_Senate_elections';
const WIKI_API = 'https://en.wikipedia.org/w/api.php';
const KALSHI_API = 'https://api.elections.kalshi.com/trade-api/v2';
const POLYMARKET_EVENT = 'https://gamma-api.polymarket.com/events?slug=which-party-will-win-the-senate-in-2026';
const HEADERS = { 'User-Agent': 'senate-map/1.0 (personal election-night viewer; Node)' };

const WIKI_EVERY = 2 * 60 * 1000;
const KALSHI_EVERY = 2 * 60 * 1000;
const KALSHI_GAP = 300; // Kalshi returns 429 when calls come in faster than this
const POLY_EVERY = 60 * 1000;

// Kalshi's event suffix differs from the state code for the two special elections.
const kalshiEvent = (code) => `SENATE${{ OH: 'OHS', FL: 'FLS' }[code] || code}-26`;
const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

const state = {
  wiki: { data: null, fetchedAt: null, error: null },
  kalshi: { data: {}, fetchedAt: null, error: null, scanning: false },
  polymarket: { data: null, fetchedAt: null, error: null },
};

async function getJson(url) {
  const res = await fetch(url, { headers: HEADERS, signal: AbortSignal.timeout(15000) });
  if (!res.ok) {
    const err = new Error(`HTTP ${res.status} from ${new URL(url).hostname}`);
    err.status = res.status;
    throw err;
  }
  return res.json();
}

async function refreshWiki() {
  try {
    // The section number moves when editors add sections, so look it up each time.
    const base = `${WIKI_API}?action=parse&page=${PAGE}&format=json&formatversion=2`;
    const toc = await getJson(`${base}&prop=tocdata`);
    const section = toc.parse.tocdata.sections.find((s) => s.line === 'Predictions');
    if (!section) throw new Error('The article no longer has a Predictions section');
    const page = await getJson(`${base}&prop=wikitext|revid&section=${section.index}`);
    const parsed = parsePredictions(page.parse.wikitext);
    if (!parsed.races.length || !parsed.columns.length) throw new Error('The Predictions table layout changed');
    state.wiki = { data: { ...parsed, revid: page.parse.revid }, fetchedAt: Date.now(), error: null };
  } catch (err) {
    state.wiki.error = err.message;
    console.error('wikipedia:', err.message);
  }
}

async function fetchKalshiEvent(code) {
  const url = `${KALSHI_API}/markets?event_ticker=${kalshiEvent(code)}`;
  for (let attempt = 0; ; attempt++) {
    try {
      const { markets } = await getJson(url);
      return parseKalshiMarkets(markets || []);
    } catch (err) {
      if (err.status !== 429 || attempt >= 3) throw err;
      await sleep(1500 * (attempt + 1));
    }
  }
}

async function refreshKalshi() {
  const races = state.wiki.data ? state.wiki.data.races : [];
  if (!races.length || state.kalshi.scanning) return;
  state.kalshi.scanning = true;
  let failed = 0;
  let lastError = null;
  for (const race of races) {
    try {
      state.kalshi.data[race.code] = await fetchKalshiEvent(race.code);
    } catch (err) {
      failed++;
      lastError = err.message;
    }
    await sleep(KALSHI_GAP);
  }
  state.kalshi.scanning = false;
  state.kalshi.error = failed ? `${failed} states failed (${lastError})` : null;
  if (failed < races.length) state.kalshi.fetchedAt = Date.now();
  if (failed) console.error('kalshi:', state.kalshi.error);
}

async function refreshPolymarket() {
  try {
    const [event] = await getJson(POLYMARKET_EVENT);
    const price = (title) => {
      const market = event.markets.find((m) => m.groupItemTitle === title);
      return market ? Number(JSON.parse(market.outcomePrices)[0]) : null;
    };
    state.polymarket = {
      data: { D: price('Democratic Party'), R: price('Republican Party') },
      fetchedAt: Date.now(),
      error: null,
    };
  } catch (err) {
    state.polymarket.error = err.message;
    console.error('polymarket:', err.message);
  }
}

function snapshot() {
  const { data: wiki, fetchedAt, error } = state.wiki;
  const src = (s) => ({ fetchedAt: s.fetchedAt, error: s.error });
  return {
    columns: wiki ? wiki.columns : [],
    races: wiki
      ? wiki.races.map((r) => ({ ...r, market: state.kalshi.data[r.code] || null }))
      : [],
    control: state.polymarket.data,
    sources: {
      wikipedia: { fetchedAt, error, revid: wiki ? wiki.revid : null, article: PAGE },
      kalshi: { ...src(state.kalshi), scanning: state.kalshi.scanning },
      polymarket: src(state.polymarket),
    },
  };
}

const MIME = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8', '.json': 'application/json' };
const PUBLIC = path.join(__dirname, 'public');

const server = http.createServer((req, res) => {
  const { pathname } = new URL(req.url, 'http://localhost');
  if (pathname === '/api/senate') {
    res.writeHead(200, { 'Content-Type': 'application/json', 'Cache-Control': 'no-store' });
    res.end(JSON.stringify(snapshot()));
    return;
  }
  const file = path.normalize(path.join(PUBLIC, pathname === '/' ? 'index.html' : pathname));
  if (!file.startsWith(PUBLIC + path.sep)) {
    res.writeHead(403).end();
    return;
  }
  fs.readFile(file, (err, body) => {
    if (err) {
      res.writeHead(404).end('Not found');
      return;
    }
    res.writeHead(200, { 'Content-Type': MIME[path.extname(file)] || 'application/octet-stream', 'Cache-Control': 'no-cache' });
    res.end(body);
  });
});

async function start() {
  server.listen(PORT, '127.0.0.1', () => console.log(`Senate map: http://localhost:${PORT}`));
  await Promise.all([refreshWiki(), refreshPolymarket()]);
  refreshKalshi();
  setInterval(refreshWiki, WIKI_EVERY);
  setInterval(refreshKalshi, KALSHI_EVERY);
  setInterval(refreshPolymarket, POLY_EVERY);
}

start();
