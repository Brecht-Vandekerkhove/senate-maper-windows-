using System.Buffers;
using System.Text;
using System.Text.Json;

namespace SenateNight;

/// <summary>The latest results, written by the service and read by the screen.</summary>
public static class LiveState
{
    public static Board? Board { get; private set; }
    public static HouseTally? House { get; private set; }
    public static string? Problem { get; private set; }
    public static DateTimeOffset LastGood { get; private set; }

    public static event Action? Changed;

    public static void Publish(Board? board, HouseTally? house, string? problem, DateTimeOffset lastGood)
    {
        Board = board;
        House = house;
        Problem = problem;
        LastGood = lastGood;
        Changed?.Invoke();
    }

    /// <summary>Written by hand because release builds trim the code reflection-based serializing needs.</summary>
    public static string ToJson()
    {
        var buffer = new ArrayBufferWriter<byte>();
        using (var w = new Utf8JsonWriter(buffer))
        {
            w.WriteStartObject();
            w.WriteString("problem", Problem);
            w.WriteString("updated", LastGood == default ? null : LastGood.ToLocalTime().ToString("HH:mm:ss"));
            if (House is { } h)
            {
                w.WriteStartObject("house");
                w.WriteNumber("d", h.D);
                w.WriteNumber("r", h.R);
                w.WriteNumber("i", h.I);
                w.WriteNumber("total", h.Total);
                w.WriteNumber("toWin", h.ToWinD);
                w.WriteEndObject();
            }
            if (Board is { } b)
            {
                w.WriteStartObject("board");
                w.WriteNumber("d", b.SeatsD);
                w.WriteNumber("r", b.SeatsR);
                w.WriteNumber("i", b.SeatsI);
                w.WriteNumber("heldD", b.HeldD);
                w.WriteNumber("heldR", b.HeldR);
                w.WriteNumber("heldI", b.HeldI);
                w.WriteNumber("toWinD", b.ToWinD);
                w.WriteNumber("toWinR", b.ToWinR);
                w.WriteNumber("called", b.Called);
                w.WriteStartArray("races");
                foreach (var r in b.Races)
                    WriteRace(w, r);
                w.WriteEndArray();
                w.WriteEndObject();
            }
            w.WriteEndObject();
        }
        return Encoding.UTF8.GetString(buffer.WrittenSpan);
    }

    private static void WriteRace(Utf8JsonWriter w, Race r)
    {
        w.WriteStartObject();
        w.WriteString("id", r.Id);
        w.WriteString("state", r.State);
        w.WriteString("postal", r.Postal);
        w.WriteBoolean("special", r.Special);
        w.WriteBoolean("ranked", r.RankedChoice);
        w.WriteString("rating", r.Rating);
        w.WriteString("url", r.Url);
        w.WriteString("status", r.Status.ToString());
        w.WriteString("close", r.PollClose?.ToLocalTime().ToString("HH:mm"));
        w.WriteNumber("closeAt", r.PollClose?.ToUnixTimeSeconds() ?? 0);
        w.WriteNumber("wonAt", (r.WonAt ?? r.UpdatedAt)?.ToUnixTimeSeconds() ?? 0);
        w.WriteNumber("pct", r.PercentIn);
        w.WriteNumber("votes", r.TotalVotes);
        w.WriteBoolean("flipped", r.Flipped);
        w.WriteString("winner", r.Winner?.Id);
        w.WriteStartArray("candidates");
        foreach (var c in r.Candidates)
        {
            w.WriteStartObject();
            w.WriteString("id", c.Id);
            w.WriteString("name", c.Name);
            w.WriteString("party", c.Party.ToString());
            w.WriteString("tag", c.PartyTag);
            w.WriteNumber("votes", c.Votes);
            w.WriteNumber("share", c.Share);
            w.WriteEndObject();
        }
        w.WriteEndArray();
        w.WriteEndObject();
    }
}
