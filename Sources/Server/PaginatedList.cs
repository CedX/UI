namespace Belin.UI;

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
