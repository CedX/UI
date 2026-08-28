namespace Belin.UI;

using System.Text.Json.Serialization;

/// <summary>
/// Enumerates different themes an operating system or application can show.
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter<AppTheme>))]
public enum AppTheme {

	/// <summary>
	/// The system theme.
	/// </summary>
	System,

	/// <summary>
	/// The light theme.
	/// </summary>
	Light,

	/// <summary>
	/// The dark theme.
	/// </summary>
	Dark
}
