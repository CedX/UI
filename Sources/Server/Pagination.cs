namespace Belin.UI;

using System.Globalization;
using System.Text.Json.Serialization;
using System.Web;

/// <summary>
/// Represents information relevant to the pagination of data items.
/// </summary>
public sealed class Pagination {

	/// <summary>
	/// The current page index.
	/// </summary>
	public int CurrentPageIndex { get; set => field = Math.Max(0, value); }

	/// <summary>
	/// Value indicating whether a next page exists.
	/// </summary>
	[JsonIgnore]
	public bool HasNextPage => CurrentPageIndex < LastPageIndex;

	/// <summary>
	/// Value indicating whether a previous page exists.
	/// </summary>
	[JsonIgnore]
	public bool HasPreviousPage => CurrentPageIndex > 0;

	/// <summary>
	/// The number of items per page.
	/// </summary>
	public int ItemsPerPage { get; set => field = Math.Clamp(value, 1, 1000); } = 25;

	/// <summary>
	/// The last page index.
	/// </summary>
	[JsonIgnore]
	public int LastPageIndex => TotalItemCount > 0 ? (int) Math.Ceiling(TotalItemCount / (double) ItemsPerPage) - 1 : 0;

	/// <summary>
	/// The data limit.
	/// </summary>
	[JsonIgnore]
	public int Limit => ItemsPerPage;

	/// <summary>
	/// The data offset.
	/// </summary>
	[JsonIgnore]
	public int Offset => CurrentPageIndex * ItemsPerPage;

	/// <summary>
	/// The total number of items.
	/// </summary>
	public int TotalItemCount { get; set => field = Math.Max(0, value); }

	/// <summary>
	/// Creates a new pagination from the specified query.
	/// </summary>
	/// <param name="query">The dictionary providing the query.</param>
	/// <param name="maxItemsPerPage">The maximum number of items allowed per page.</param>
	/// <returns>The pagination corresponding to the specified query.</returns>
	public static Pagination FromQuery(IDictionary<string, string?> query, int maxItemsPerPage = 1000) {
		int parseInt(string key, int defaultValue) {
			var numericString = query.TryGetValue(key, out var value) ? value : defaultValue.ToString(CultureInfo.InvariantCulture);
			return int.TryParse(numericString, NumberStyles.None, CultureInfo.InvariantCulture, out var result) ? result : defaultValue;
		}

		return new Pagination {
			CurrentPageIndex = parseInt("Page", 1) - 1,
			ItemsPerPage = Math.Min(maxItemsPerPage, parseInt("PerPage", 25))
		};
	}

	/// <summary>
	/// Creates a new pagination from the specified query.
	/// </summary>
	/// <param name="query">The string providing the query.</param>
	/// <param name="maxItemsPerPage">The maximum number of items allowed per page.</param>
	/// <returns>The pagination corresponding to the specified query.</returns>
	public static Pagination FromQuery(string query, int maxItemsPerPage = 1000) {
		var queryString = HttpUtility.ParseQueryString(query);
		return FromQuery(queryString.AllKeys.ToDictionary(key => key ?? "", key => queryString[key]), maxItemsPerPage);
	}
}
