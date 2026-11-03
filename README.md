# Senate Night 2026

Two things live here.

## SenateNight.exe: the live scoreboard

A small always-on-top window with today's Senate races. Double-click `SenateNight.exe`. It needs the .NET 10 Desktop Runtime.

- Refreshes every minute. The current score is in the title bar, so you can read it from the taskbar.
- Shows a House tally, read every 2 minutes because that file is about 7 MB.
- Sends a Windows alert when a Senate race is called, goes to a runoff or has a call withdrawn, and when a party wins control of either chamber.
- Tick "Show map" to open a live map to the left of the scoreboard. Hover a state for its numbers.
- Click a race or state to open it on nytimes.com.

Run `SenateNight.exe --test-alert` to check that alerts reach you. Windows hides them while Do Not Disturb is on.

Results come from the JSON files behind the New York Times results page, which uses AP data. The files are public but undocumented, so NYT can change them without notice. The app warns you if it can't refresh, or if polls have been closed for 30 minutes with no votes in the feed. This is for personal use.

To change or rebuild it:

```
cd widget/SenateNight.Tests && dotnet test
dotnet publish widget/SenateNight -c Release -o widget/publish
```

Then copy `widget/publish/SenateNight.exe` here. Don't publish directly into this folder: it contains the project, so the SDK would exclude the source files.

To replay saved files instead of the live feed, use `--source senate.json` and `--house-source house.json`. `--poll 5` sets the refresh in seconds, and `--map` starts with the map open.

## server.js: the forecast comparison map

A browser page comparing what 12 forecasters and betting markets predicted for each seat. It shows no live vote counts. Run `node server.js` (Node 18 or newer) and open http://localhost:5177.

Ratings come from Wikipedia's hand-edited Predictions table, odds from Kalshi and Polymarket. Parser tests run with `npm test`.
