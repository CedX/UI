namespace Belin.UI.Data;

using System.Web;

/// <summary>
/// Tests the features of the <see cref="Pagination"/> class.
/// </summary>
[TestClass]
public sealed class PaginationTests {

	[TestMethod]
	public void CurrentPageIndex() {
		// It should always be greater than or equal to zero.
		AreEqual(0, new Pagination { CurrentPageIndex = -1 }.CurrentPageIndex);
	}

	[TestMethod]
	public void HasNextPage() {
		// It should return `false` if there is no next page.
		IsFalse(new Pagination().HasNextPage);

		// It should return `true` if a next page exists.
		IsTrue(new Pagination { CurrentPageIndex = 2, TotalItemCount = 123 }.HasNextPage);
	}

	[TestMethod]
	public void HasPreviousPage() {
		// It should return `false` if there is no previous page.
		IsFalse(new Pagination().HasPreviousPage);

		// It should return `true` if a previous page exists.
		IsTrue(new Pagination { CurrentPageIndex = 5 }.HasPreviousPage);
	}

	[TestMethod]
	public void ItemsPerPage() {
		// It should always be between 1 and 1000.
		AreEqual(1, new Pagination { ItemsPerPage = -1 }.ItemsPerPage);
		AreEqual(1000, new Pagination { ItemsPerPage = 9999 }.ItemsPerPage);
	}

	[TestMethod]
	public void LastPageIndex() {
		// It should return the total count divided by the page size rounded up, minus one.
		AreEqual(0, new Pagination { TotalItemCount = 0 }.LastPageIndex);
		AreEqual(122, new Pagination { ItemsPerPage = 1, TotalItemCount = 123 }.LastPageIndex);
		AreEqual(2, new Pagination { ItemsPerPage = 10, TotalItemCount = 25 }.LastPageIndex);
	}

	[TestMethod]
	public void Offset() {
		// It should return the page size multiplied by the page index.
		AreEqual(0, new Pagination().Offset);
		AreEqual(100, new Pagination { CurrentPageIndex = 4 }.Offset);
		AreEqual(610, new Pagination { CurrentPageIndex = 122, ItemsPerPage = 5 }.Offset);
	}

	[TestMethod]
	public void TotalItemCount() {
		// It should always be greater than or equal to zero.
		AreEqual(0, new Pagination { TotalItemCount = -1 }.TotalItemCount);
		AreEqual(123, new Pagination { TotalItemCount = 123 }.TotalItemCount);
	}

	[TestMethod]
	public void FromQuery() {
		// It should create a new pagination from the specified query.
		var pagination = Pagination.FromQuery(HttpUtility.ParseQueryString("Page=100&PerPage=50"));
		AreEqual(99, pagination.CurrentPageIndex);
		AreEqual(50, pagination.ItemsPerPage);

		// It should allow setting a maximum allowed value for the `ItemsPerPage` property.
		pagination = Pagination.FromQuery(HttpUtility.ParseQueryString("PerPage=666"), maxItemsPerPage: 100);
		AreEqual(0, pagination.CurrentPageIndex);
		AreEqual(100, pagination.ItemsPerPage);
	}
}
