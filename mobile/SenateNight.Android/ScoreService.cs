using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.OS;
using Android.Runtime;
using OperationCanceledException = System.OperationCanceledException;

namespace SenateNight;

/// <summary>Keeps polling with the app closed. Holds the ongoing score notification and sends the alerts.</summary>
[Register("senatenight.ScoreService")]
public sealed class ScoreService : Service
{
    public const string ActionStop = "senatenight.STOP";

    private const string ScoreChannel = "score";
    private const string CallsChannel = "calls";
    private const int ScoreNotificationId = 1;

    private static readonly TimeSpan PollEvery = TimeSpan.FromSeconds(60);
    private static readonly TimeSpan HouseEvery = TimeSpan.FromMinutes(2);

    private CancellationTokenSource? _running;
    private PowerManager.WakeLock? _wakeLock;
    private int _nextAlertId = 100;

    public static bool IsRunning { get; private set; }

    public override IBinder? OnBind(Intent? intent) => null;

    public override StartCommandResult OnStartCommand(Intent? intent, StartCommandFlags flags, int startId)
    {
        if (intent?.Action == ActionStop)
        {
            StopForeground(StopForegroundFlags.Remove);
            StopSelf();
            return StartCommandResult.NotSticky;
        }

        CreateChannels();
        var first = BuildScoreNotification("Senate Night", "Loading results…", null);
        if (OperatingSystem.IsAndroidVersionAtLeast(34))
            StartForeground(ScoreNotificationId, first, ForegroundService.TypeSpecialUse);
        else
            StartForeground(ScoreNotificationId, first);

        if (_running is null)
        {
            IsRunning = true;
            _running = new CancellationTokenSource();
            // Without this the phone sleeps between polls and the score stops moving.
            _wakeLock = ((PowerManager)GetSystemService(PowerService)!).NewWakeLock(WakeLockFlags.Partial, "senatenight:poll");
            _wakeLock!.Acquire();
            _ = RunAsync(_running.Token);
        }
        return StartCommandResult.Sticky;
    }

    public override void OnDestroy()
    {
        IsRunning = false;
        _running?.Cancel();
        if (_wakeLock is { IsHeld: true }) _wakeLock.Release();
        base.OnDestroy();
    }

    private async Task RunAsync(CancellationToken token)
    {
        var client = CreateClient();
        Board? board = null;
        HouseTally? house = null;
        string? houseProblem = null;
        var houseDue = DateTimeOffset.MinValue;
        var lastGood = default(DateTimeOffset);

        while (!token.IsCancellationRequested)
        {
            string? problem = null;
            try
            {
                var (next, warning) = await client.FetchAsync(token);
                problem = warning;
                foreach (var alert in Alerts.Diff(board, next))
                    Notify(alert);
                board = next;
                lastGood = DateTimeOffset.Now;
            }
            catch (OperationCanceledException) when (token.IsCancellationRequested)
            {
                return;
            }
            catch (Exception e) when (IsFeedError(e))
            {
                problem = board is null
                    ? "Can't load results yet. Retrying every minute."
                    : $"Can't refresh. Showing results from {lastGood.ToLocalTime():HH:mm}.";
            }

            if (DateTimeOffset.UtcNow >= houseDue)
            {
                houseDue = DateTimeOffset.UtcNow + HouseEvery;
                try
                {
                    if (await client.FetchHouseAsync(token) is { } nextHouse)
                    {
                        foreach (var alert in Alerts.DiffHouse(house, nextHouse))
                            Notify(alert);
                        house = nextHouse;
                    }
                    houseProblem = null;
                }
                catch (OperationCanceledException) when (token.IsCancellationRequested)
                {
                    return;
                }
                catch (Exception e) when (IsFeedError(e))
                {
                    houseProblem = house is null ? "House tally isn't available yet." : "House tally didn't refresh, so it may be behind.";
                }
            }

            if (problem is null && board is { TotalVotes: 0, FirstClose: { } first } && DateTimeOffset.UtcNow > first.AddMinutes(30))
                problem = "Polls have closed but the feed has no votes. It may have moved, so check nytimes.com.";

            problem ??= houseProblem;
            LiveState.Publish(board, house, problem, lastGood);
            UpdateScoreNotification(board, house, problem);

            try { await Task.Delay(PollEvery, token); }
            catch (OperationCanceledException) { return; }
        }
    }

    /// <summary>Replays saved files when they're placed in the app's folder, for testing without a live election.</summary>
    private FeedClient CreateClient()
    {
        var folder = GetExternalFilesDir(null)?.AbsolutePath;
        string? Replay(string name) => folder is not null && File.Exists(Path.Combine(folder, name)) ? Path.Combine(folder, name) : null;
        return new FeedClient(Replay("replay-senate.json"), Replay("replay-house.json"));
    }

    private static bool IsFeedError(Exception e) =>
        e is HttpRequestException or TaskCanceledException or System.Text.Json.JsonException or KeyNotFoundException or InvalidOperationException or IOException;

    private void CreateChannels()
    {
        var manager = (NotificationManager)GetSystemService(NotificationService)!;
        var score = new NotificationChannel(ScoreChannel, "Live score", NotificationImportance.Low)
        {
            Description = "The ongoing score. Silent.",
        };
        var calls = new NotificationChannel(CallsChannel, "Race calls", NotificationImportance.High)
        {
            Description = "Senate race calls, runoffs, and a party winning control.",
        };
        manager.CreateNotificationChannel(score);
        manager.CreateNotificationChannel(calls);
    }

    private PendingIntent OpenApp()
    {
        var open = new Intent(this, typeof(MainActivity)).AddFlags(ActivityFlags.SingleTop);
        return PendingIntent.GetActivity(this, 0, open, PendingIntentFlags.Immutable | PendingIntentFlags.UpdateCurrent)!;
    }

    private Notification BuildScoreNotification(string title, string text, string? expanded)
    {
        var stop = new Intent(this, typeof(ScoreService)).SetAction(ActionStop);
        var stopIntent = PendingIntent.GetService(this, 1, stop, PendingIntentFlags.Immutable | PendingIntentFlags.UpdateCurrent);
        var builder = new Notification.Builder(this, ScoreChannel)
            .SetSmallIcon(Resource.Drawable.ic_stat)
            .SetContentTitle(title)
            .SetContentText(text)
            .SetContentIntent(OpenApp())
            .SetOngoing(true)
            .SetOnlyAlertOnce(true)
            .AddAction(new Notification.Action.Builder(
                Android.Graphics.Drawables.Icon.CreateWithResource(this, Resource.Drawable.ic_stat),
                new Java.Lang.String("Stop updates"),
                stopIntent).Build());
        if (expanded is not null)
            builder.SetStyle(new Notification.BigTextStyle().BigText(expanded));
        return builder.Build();
    }

    private void UpdateScoreNotification(Board? board, HouseTally? house, string? problem)
    {
        if (board is null)
        {
            Show(BuildScoreNotification("Senate Night", problem ?? "Loading results…", null));
            return;
        }

        var title = $"Senate D {board.SeatsD} · R {board.SeatsR}" + (house is { } h ? $"   House D {h.D} · R {h.R}" : "");
        var closest = board.Races.Where(r => r.Status == RaceStatus.Counting)
            .OrderBy(r => r.Candidates.Count > 1 ? r.Candidates[0].Share - r.Candidates[1].Share : 100)
            .Take(4)
            .Select(r => $"{r.Postal}: {r.Candidates[0].Name} ({r.Candidates[0].PartyTag}) +{r.Candidates[0].Share - (r.Candidates.Count > 1 ? r.Candidates[1].Share : 0):0.0}, {r.PercentIn:0}% in")
            .ToList();
        var next = board.Races.Where(r => r.Status == RaceStatus.Upcoming && r.PollClose is not null)
            .GroupBy(r => r.PollClose!.Value).OrderBy(g => g.Key).FirstOrDefault();

        var summary = problem
            ?? (closest.Count > 0 ? closest[0]
                : next is not null ? $"Next polls close {next.Key.ToLocalTime():HH:mm}: {string.Join(", ", next.Select(r => r.Postal).Take(6))}"
                : $"{board.Called} of {board.Races.Count} Senate races called");

        var lines = new List<string>();
        if (problem is not null) lines.Add(problem);
        lines.Add($"{board.Called} of {board.Races.Count} Senate races called");
        lines.AddRange(closest);
        Show(BuildScoreNotification(title, summary, string.Join("\n", lines)));
    }

    private void Show(Notification notification) =>
        ((NotificationManager)GetSystemService(NotificationService)!).Notify(ScoreNotificationId, notification);

    private void Notify(Alert alert)
    {
        var notification = new Notification.Builder(this, CallsChannel)
            .SetSmallIcon(Resource.Drawable.ic_stat)
            .SetContentTitle(alert.Title)
            .SetContentText(alert.Body)
            .SetContentIntent(OpenApp())
            .SetAutoCancel(true)
            .Build();
        ((NotificationManager)GetSystemService(NotificationService)!).Notify(_nextAlertId++, notification);
    }
}
