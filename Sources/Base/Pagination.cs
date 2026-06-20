namespace Belin.UI;

using System.Collections;
using System.Collections.Specialized;
using System.Globalization;
using System.Text.Json.Serialization;

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
	/// <param name="query">The hash table providing the query.</param>
	/// <param name="maxItemsPerPage">The maximum number of items allowed per page.</param>
	/// <returns>The pagination corresponding to the specified query.</returns>
	public static Pagination FromQuery(Hashtable query, int maxItemsPerPage = 25) {
		var collection = new NameValueCollection();
		foreach (DictionaryEntry entry in query) collection.Add(entry.Key.ToString(), entry.Value?.ToString());
		return FromQuery(collection, maxItemsPerPage);
	}

	/// <summary>
	/// Creates a new pagination from the specified query.
	/// </summary>
	/// <param name="query">The name/value collection providing the query.</param>
	/// <param name="maxItemsPerPage">The maximum number of items allowed per page.</param>
	/// <returns>The pagination corresponding to the specified query.</returns>
	public static Pagination FromQuery(NameValueCollection query, int maxItemsPerPage = 1000) {
		static bool tryParseInt(string value, out int result) => int.TryParse(value, NumberStyles.None, CultureInfo.InvariantCulture, out result);
		return new Pagination {
			CurrentPageIndex = (tryParseInt(query["Page"] ?? "1", out var page) ? page : 1) - 1,
			ItemsPerPage = Math.Min(maxItemsPerPage, tryParseInt(query["PerPage"] ?? "25", out var perPage) ? perPage : 25)
		};
	}
}

/// <summary>
/// A list with information relevant to the pagination of its items.
/// </summary>
/// <typeparam name="T">The type of items in the list.</typeparam>
/// <param name="items">The collection whose elements are copied to the new list.</param>
public sealed class PaginatedList<T>(IEnumerable<T>? items = null): List<T>(items ?? []) {

	/// <summary>
	/// The information relevant to the pagination of list items.
	/// </summary>
	public Pagination Pagination { get; set; } = new();

	/// <summary>
	/// Creates an empty paginated list.
	/// </summary>
	/// <param name="itemsPerPage">The number of items per page.</param>
	/// <returns>An empty paginated list with the specified number of items per page.</returns>
	public static PaginatedList<T> Empty(int itemsPerPage) => new() {
		Pagination = new() { ItemsPerPage = itemsPerPage }
	};
}
