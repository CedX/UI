namespace Belin.UI;

using System.Globalization;

/// <summary>
/// Provides extension members for strings.
/// </summary>
public static class StringExtensions {
	extension(string value) {

		/// <summary>
		/// Converts the first character of this string to uppercase.
		/// </summary>
		/// <param name="culture">An object that supplies culture-specific formatting information.</param>
		/// <returns>The processed string.</returns>
		public string Capitalize(CultureInfo? culture = null) =>
			value.Length == 0 ? "" : char.ToUpper(value[0], culture ?? CultureInfo.CurrentCulture) + value[1..];

		/// <summary>
		/// Truncates the specified string to the given number of characters.
		/// </summary>
		/// <param name="length">The maximum length.</param>
		/// <param name="ellipsis">The ellipsis to append to the truncated text.</param>
		/// <returns>The truncated string.</returns>
		public string Truncate(int length, string ellipsis = "...") => value.Length > length ? $"{value[..length]}{ellipsis}" : value;
	}
}
