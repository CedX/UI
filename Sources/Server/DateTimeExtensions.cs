namespace Belin.UI;

using System.Globalization;

/// <summary>
/// Provides extension members for dates and times.
/// </summary>
public static class DateTimeExtensions {
	extension(DateTime dateTime) {

		/// <summary>
		/// The quarter corresponding to this date.
		/// </summary>
		public int Quarter => (dateTime.Month - 1) / 3 + 1;

		/// <summary>
		/// The week number corresponding to this date.
		/// </summary>
		public int WeekOfYear => ISOWeek.GetWeekOfYear(dateTime);
	}
}
