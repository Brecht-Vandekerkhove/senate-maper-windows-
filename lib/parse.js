'use strict';
// Turns the "Predictions" section of Wikipedia's 2026 Senate article into plain data.

const SCORE = { Safe: 4, Solid: 4, Likely: 3, Lean: 2, Tilt: 1 };

const STATE_CODES = {
  Alabama: 'AL', Alaska: 'AK', Arkansas: 'AR', Colorado: 'CO', Delaware: 'DE', Florida: 'FL',
  Georgia: 'GA', Idaho: 'ID', Illinois: 'IL', Iowa: 'IA', Kansas: 'KS', Kentucky: 'KY',
  Louisiana: 'LA', Maine: 'ME', Massachusetts: 'MA', Michigan: 'MI', Minnesota: 'MN',
  Mississippi: 'MS', Montana: 'MT', Nebraska: 'NE', 'New Hampshire': 'NH', 'New Jersey': 'NJ',
  'New Mexico': 'NM', 'North Carolina': 'NC', Ohio: 'OH', Oklahoma: 'OK', Oregon: 'OR',
  'Rhode Island': 'RI', 'South Carolina': 'SC', 'South Dakota': 'SD', Tennessee: 'TN',
  Texas: 'TX', Virginia: 'VA', 'West Virginia': 'WV', Wyoming: 'WY',
};

// Removes {{name|...}} templates, including nested braces.
function stripTemplate(text, name) {
  const lower = text.toLowerCase();
  const needle = '{{' + name.toLowerCase();
  let out = '';
  let i = 0;
  while (i < text.length) {
    const start = lower.indexOf(needle, i);
    if (start === -1) return out + text.slice(i);
    out += text.slice(i, start);
    let depth = 0;
    let j = start;
    for (; j < text.length; j++) {
      if (text.startsWith('{{', j)) { depth++; j++; }
      else if (text.startsWith('}}', j)) { depth--; j++; if (depth === 0) { j++; break; } }
    }
    i = j;
  }
  return out;
}

function plain(text) {
  return text
    .replace(/<ref[^>]*\/>/g, '')
    .replace(/<ref[\s\S]*?<\/ref>/g, '')
    .replace(/<br\s*\/?>/gi, ' ')
    .replace(/\{\{sortname\|([^|}]+)\|([^|}]+)[^}]*\}\}/gi, '$1 $2')
    .replace(/\{\{abbr\|([^|}]+)\|[^}]*\}\}/gi, '$1')
    .replace(/\{\{small\|([^{}]*)\}\}/gi, '$1')
    .replace(/\[\[(?:[^\]|]*\|)?([^\]]*)\]\]/g, '$1')
    .replace(/'''?/g, '')
    .replace(/\s+/g, ' ')
    .trim();
}

function shadingParty(text) {
  const m = text.match(/Party shading\/(Republican|Democratic|DFL|Independent)/i);
  if (!m) return null;
  return { republican: 'R', democratic: 'D', dfl: 'D', independent: 'I' }[m[1].toLowerCase()];
}

function parseColumns(wikitext) {
  const columns = [];
  for (const line of wikitext.split('\n')) {
    if (!line.startsWith('!') || !/\{\{small\|/i.test(line) || !/<ref/.test(line)) continue;
    const link = line.match(/\[\[(?:[^\]|]*\|)?([^\]]+)\]\]/);
    if (!link) continue;
    const date = line.match(/\{\{small\|([^}]*)\}\}/i);
    const url = line.match(/\|\s*url\s*=\s*(https?:[^|\s}]+)/i);
    columns.push({
      id: link[1],
      asOf: date ? plain(date[1]) : null,
      url: url ? url[1] : null,
    });
  }
  return columns;
}

function parseRating(cell) {
  const m = cell.match(/\{\{USRaceRating\|([^}]*)\}\}/i);
  if (!m) return null;
  const [strength, party] = m[1].split('|').map((s) => s.trim());
  if (/^toss/i.test(strength)) return { label: 'Toss-up', party: null, score: 0 };
  const base = SCORE[strength];
  if (!base || !party) return null;
  // Forecasters say "Safe" or "Solid" for the same thing, so they share one label.
  const label = base === 4 ? 'Safe' : strength;
  return { label: `${label} ${party}`, party, score: party === 'R' ? -base : base };
}

// Returns null while the race is undecided.
function parseResult(cell) {
  if (!cell || /\{\{TBA/i.test(cell)) return null;
  const text = plain(stripTemplate(cell.replace(/^\|/, ''), 'efn').replace(/\{\{Party shading\/[^}]*\}\}\s*(?:[^|]*\|)?/i, ''));
  if (!text || /^(TBD|to be determined)$/i.test(text)) return null;
  if (/runoff/i.test(text)) return { status: 'runoff', party: null, name: null, text };
  const bold = cell.match(/'''(.+?)'''/);
  const inline = text.match(/%\s*(R|D|I|DFL)\b/) || text.match(/\b(R|D|I|DFL)\s*(?:\(|hold|gain|flip|$)/i);
  const party = shadingParty(cell) || (inline ? inline[1].toUpperCase().replace('DFL', 'D') : null);
  return { status: party ? 'called' : 'unknown', party, name: bold ? plain(bold[1]) : null, text };
}

function parsePredictions(wikitext) {
  const columns = parseColumns(wikitext);
  const rows = wikitext.split(/\n\|-[^\n]*(?=\n)/).filter((r) => /^\s*!\s*\[\[2026 United States Senate/.test(r));
  const races = rows.map((row) => {
    const clean = row.replace(/^\s+/, '');
    const head = clean.match(/^!\s*\[\[([^|\]]+)\|([^\]]+)\]\]/);
    const stateName = head[2];
    const lines = clean.split('\n');
    const cellLines = lines.filter((l) => /^(\||<!--)/.test(l.trim()));

    const pvi = (row.match(/\{\{Shading PVI\|([A-Z]+)\|(\d+)\}\}/) || []);
    const senatorLine = cellLines[1] || '';
    const note = senatorLine.match(/\{\{small\|\(([^)]*)\)\}\}/i);
    const senatorCell = senatorLine.replace(/^\|\s*(\{\{Party shading\/[^}]*\}\}\s*\|)?/i, '').replace(/\{\{small\|[^}]*\}\}/gi, '');
    const lastCell = stripTemplate(cellLines[2] || '', 'efn').replace(/^\|.*?data-sort-value="[^"]*"\s*\|/, '');

    const ratingLines = lines.filter((l) => /^<!--[^>]*-->/.test(l.trim()));
    const ratingCells = ratingLines.length === columns.length
      ? ratingLines
      : (row.match(/\{\{USRaceRating\|[^}]*\}\}/gi) || []);
    const ratings = {};
    columns.forEach((c, i) => { ratings[c.id] = ratingCells[i] ? parseRating(ratingCells[i]) : null; });

    const resultLine = [...cellLines].reverse().find((l) => !/^<!--/.test(l.trim()));

    return {
      state: stateName,
      code: STATE_CODES[stateName] || null,
      special: /\(special/i.test(clean.split('\n')[0]),
      article: head[1],
      pvi: pvi[1] ? (pvi[1] === 'EVEN' ? 'EVEN' : `${pvi[1]}+${pvi[2]}`) : null,
      incumbent: plain(senatorCell),
      incumbentNote: note ? note[1] : null,
      incumbentParty: shadingParty(senatorLine),
      lastElection: plain(lastCell),
      ratings,
      result: parseResult(resultLine),
    };
  });
  return { columns, races };
}

// Kalshi's per-candidate markets. Anything that isn't -R or -D is an independent.
function parseKalshiMarkets(markets) {
  const candidates = markets.map((m) => {
    const bid = Number(m.yes_bid_dollars);
    const ask = Number(m.yes_ask_dollars);
    const last = Number(m.last_price_dollars);
    const suffix = m.ticker.split('-').pop();
    return {
      name: m.yes_sub_title,
      party: suffix === 'R' || suffix === 'D' ? suffix : 'I',
      // A one-sided book has no meaningful midpoint, so fall back to the last trade.
      probability: bid > 0 && ask > 0 && ask < 1 ? (bid + ask) / 2 : last,
      settled: m.result === 'yes',
    };
  }).sort((a, b) => b.probability - a.probability);
  if (!candidates.length) return null;
  const winner = candidates.find((c) => c.settled);
  return { candidates, winner: winner ? { party: winner.party, name: winner.name } : null };
}

module.exports = { parsePredictions, parseKalshiMarkets, parseResult, parseRating };
