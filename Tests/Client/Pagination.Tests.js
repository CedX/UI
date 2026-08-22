import {Pagination} from "@cedx/ui/Pagination.js";
import {assert} from "chai";

/**
 * Tests the features of the {@link Pagination} class.
 */
describe("Pagination", () => {
	describe("currentPageIndex", () => {
		it("should always be greater than or equal to zero", () =>
			assert.equal(new Pagination({currentPageIndex: -1}).currentPageIndex, 0));
	});

	describe("hasNextPage", () => {
		it("should return `false` if there is no next page", () =>
			assert.isFalse(new Pagination().hasNextPage));

		it("should return `true` if a next page exists", () =>
			assert.isTrue(new Pagination({currentPageIndex: 2, totalItemCount: 123}).hasNextPage));
	});

	describe("hasPreviousPage", () => {
		it("should return `false` if there is no previous page", () =>
			assert.isFalse(new Pagination().hasPreviousPage));

		it("should return `true` if a previous page exists", () =>
			assert.isTrue(new Pagination({currentPageIndex: 5}).hasPreviousPage));
	});

	describe("itemsPerPage", () => {
		it("should always be between 1 and 1000", () => {
			assert.equal(new Pagination({itemsPerPage: -1}).itemsPerPage, 1);
			assert.equal(new Pagination({itemsPerPage: 9999}).itemsPerPage, 1000);
		});
	});

	describe("lastPageIndex", () => {
		it("should return the total count divided by the page size rounded up, minus one", () => {
			assert.equal(new Pagination({totalItemCount: 0}).lastPageIndex, 0);
			assert.equal(new Pagination({itemsPerPage: 1, totalItemCount: 123}).lastPageIndex, 122);
			assert.equal(new Pagination({itemsPerPage: 10, totalItemCount: 25}).lastPageIndex, 2);
		});
	});

	describe("offset", () => {
		it("should return the page size multiplied by the page index", () => {
			assert.equal(new Pagination().offset, 0);
			assert.equal(new Pagination({currentPageIndex: 4}).offset, 100);
			assert.equal(new Pagination({currentPageIndex: 122, itemsPerPage: 5}).offset, 610);
		});
	});

	describe("totalItemCount", () => {
		it("should always be greater than or equal to zero", () => {
			assert.equal(new Pagination({totalItemCount: -1}).totalItemCount, 0);
			assert.equal(new Pagination({totalItemCount: 123}).totalItemCount, 123);
		});
	});

	describe("fromQuery()", () => {
		it("should create a new pagination from the specified query", () => {
			const pagination = Pagination.fromQuery("Page=100&PerPage=50");
			assert.equal(pagination.currentPageIndex, 99);
			assert.equal(pagination.itemsPerPage, 50);
		});

		it("should allow setting a maximum allowed value for the `itemsPerPage` property", () => {
			const pagination = Pagination.fromQuery("PerPage=666", 100);
			assert.equal(pagination.currentPageIndex, 0);
			assert.equal(pagination.itemsPerPage, 100);
		});
	});
});
