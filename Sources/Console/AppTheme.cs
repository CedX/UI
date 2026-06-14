namespace Belin.UI;

using System.Text.Json.Serialization;

/// <summary>
/// Enumerates different themes an operating system or application can show.
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter))]
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

/// <summary>
/// Provides extension members for application themes.
/// </summary>
public static class AppThemeExtensions {
	extension(AppTheme appTheme) {

		/// <summary>
		/// The icon corresponding to this theme.
		/// </summary>
		public string Icon => appTheme switch {
			AppTheme.Dark => "dark_mode",
			AppTheme.Light => "light_mode",
			AppTheme.System => "contrast"
		};

		/// <summary>
		/// The text corresponding to this theme.
		/// </summary>
		public string Text => appTheme switch {
			AppTheme.Dark => "Sombre",
			AppTheme.Light => "Clair",
			AppTheme.System => "Auto"
		};
	}
}
