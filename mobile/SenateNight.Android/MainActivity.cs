using Android.App;
using Android.Content;
using Android.Content.PM;
using Android.Graphics;
using Android.OS;
using Android.Provider;
using Android.Views;
using Android.Webkit;
using Android.Widget;

namespace SenateNight;

[Activity(Label = "Senate Night", MainLauncher = true, Exported = true, LaunchMode = LaunchMode.SingleTop,
    ConfigurationChanges = ConfigChanges.Orientation | ConfigChanges.ScreenSize | ConfigChanges.UiMode)]
public sealed class MainActivity : Activity
{
    private const int NotificationRequest = 1;

    private WebView? _web;
    private bool _pageReady;

    protected override void OnCreate(Bundle? savedInstanceState)
    {
        base.OnCreate(savedInstanceState);

        // Android 15 draws apps behind the system bars. This keeps the page clear of them.
        var root = new FrameLayout(this);
        root.SetFitsSystemWindows(true);
        var dark = (Resources!.Configuration!.UiMode & Android.Content.Res.UiMode.NightMask) == Android.Content.Res.UiMode.NightYes;
        root.SetBackgroundColor(Color.ParseColor(dark ? "#11141a" : "#eef0f4"));

        _web = new WebView(this);
        _web.Settings.JavaScriptEnabled = true;
        _web.Settings.AllowFileAccess = true;
        _web.SetBackgroundColor(Color.Transparent);
        _web.SetWebViewClient(new PageClient(this));
        root.AddView(_web, new ViewGroup.LayoutParams(ViewGroup.LayoutParams.MatchParent, ViewGroup.LayoutParams.MatchParent));
        SetContentView(root);
        _web.LoadUrl("file:///android_asset/app.html");

        if (OperatingSystem.IsAndroidVersionAtLeast(33) && CheckSelfPermission(Android.Manifest.Permission.PostNotifications) != Permission.Granted)
            RequestPermissions([Android.Manifest.Permission.PostNotifications], NotificationRequest);
        else
            StartUpdates();
    }

    public override void OnRequestPermissionsResult(int requestCode, string[] permissions, Permission[] grantResults)
    {
        base.OnRequestPermissionsResult(requestCode, permissions, grantResults);
        // Updates still run if they said no. The score just won't show outside the app.
        if (requestCode == NotificationRequest) StartUpdates();
    }

    protected override void OnResume()
    {
        base.OnResume();
        LiveState.Changed += Push;
        Push();
    }

    protected override void OnPause()
    {
        LiveState.Changed -= Push;
        base.OnPause();
    }

    private void StartUpdates() => StartForegroundService(new Intent(this, typeof(ScoreService)));

    private void Push()
    {
        RunOnUiThread(() =>
        {
            if (!_pageReady || _web is null) return;
            var power = (PowerManager)GetSystemService(PowerService)!;
            var settings = $"{{\"running\":{(ScoreService.IsRunning ? "true" : "false")},\"batteryOk\":{(power.IsIgnoringBatteryOptimizations(PackageName) ? "true" : "false")}}}";
            _web.EvaluateJavascript($"window.render({LiveState.ToJson()},{settings})", null);
        });
    }

    /// <summary>The page asks for phone actions by navigating to senate:// addresses.</summary>
    private void HandleCommand(string command)
    {
        switch (command)
        {
            case "battery":
                // Some phones kill background apps even with a notification showing, unless exempted.
                var request = new Intent(Settings.ActionRequestIgnoreBatteryOptimizations, Android.Net.Uri.Parse("package:" + PackageName));
                StartActivity(request);
                break;
            case "start":
                StartUpdates();
                break;
            case "stop":
                StartService(new Intent(this, typeof(ScoreService)).SetAction(ScoreService.ActionStop));
                break;
        }
        _web?.PostDelayed(Push, 400);
    }

    private sealed class PageClient(MainActivity activity) : WebViewClient
    {
        public override void OnPageFinished(WebView? view, string? url)
        {
            activity._pageReady = true;
            activity.Push();
        }

        public override bool ShouldOverrideUrlLoading(WebView? view, IWebResourceRequest? request)
        {
            var uri = request?.Url;
            if (uri is null) return true;
            if (uri.Scheme == "senate")
                activity.HandleCommand(uri.Host ?? "");
            else if (uri.Scheme == "https")
                activity.StartActivity(new Intent(Intent.ActionView, uri));
            return true;
        }
    }
}
