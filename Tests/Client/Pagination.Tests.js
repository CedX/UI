import {Pagination} from "@cedx/ui/Pagination.js";

/**
 * Tests the features of the {@link Pagination} class.
 */
describe("Pagination", () => {
	describe("currentPageIndex", () => {
		it("should always be greater than or equal to zero", () =>
			new Pagination({currentPageIndex: -1}).currentPageIndex.should.equal(0));
	});

	describe("hasNextPage", () => {
		it("should return `false` if there is no next page", () =>
			new Pagination().hasNextPage.should.be.false);

		it("should return `true` if a next page exists", () =>
			new Pagination({currentPageIndex: 2, totalItemCount: 123}).hasNextPage.should.be.true);
	});

	describe("hasPreviousPage", () => {
		it("should return `false` if there is no previous page", () =>
			new Pagination().hasPreviousPage.should.be.false);

		it("should return `true` if a previous page exists", () =>
			new Pagination({currentPageIndex: 5}).hasPreviousPage.should.be.true);
	});

	describe("itemsPerPage", () => {
		it("should always be between 1 and 1000", () => {
			new Pagination({itemsPerPage: -1}).itemsPerPage.should.equal(1);
			new Pagination({itemsPerPage: 9_999}).itemsPerPage.should.equal(1_000);
		});
	});

	describe("lastPageIndex", () => {
		it("should return the total count divided by the page size rounded up, minus one", () => {
			new Pagination({totalItemCount: 0}).lastPageIndex.should.equal(0);
			new Pagination({itemsPerPage: 1, totalItemCount: 123}).lastPageIndex.should.equal(122);
			new Pagination({itemsPerPage: 10, totalItemCount: 25}).lastPageIndex.should.equal(2);
		});
	});

	describe("offset", () => {
		it("should return the page size multiplied by the page index", () => {
			new Pagination().offset.should.equal(0);
			new Pagination({currentPageIndex: 4}).offset.should.equal(100);
			new Pagination({currentPageIndex: 122, itemsPerPage: 5}).offset.should.equal(610);
		});
	});

	describe("totalItemCount", () => {
		it("should always be greater than or equal to zero", () => {
			new Pagination({totalItemCount: -1}).totalItemCount.should.equal(0);
			new Pagination({totalItemCount: 123}).totalItemCount.should.equal(123);
		});
	});

	describe("ofQuery()", () => {
		it("should create a new pagination from the specified query", () => {
			const pagination = Pagination.ofQuery("Page=100&PerPage=50");
			pagination.currentPageIndex.should.equal(99);
			pagination.itemsPerPage.should.equal(50);
		});

		it("should allow setting a maximum allowed value for the `itemsPerPage` property", () => {
			const pagination = Pagination.ofQuery("PerPage=666", 100);
			pagination.currentPageIndex.should.equal(0);
			pagination.itemsPerPage.should.equal(100);
		});
	});
});
