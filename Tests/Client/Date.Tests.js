import {atMidnight, getDaysInMonth, getQuarter, getWeekOfYear} from "@cedx/ui/Date.js";
import {assert} from "chai";

/**
 * Tests the features of the date functions.
 */
describe("Date", () => {
	describe("atMidnight()", () => {
		it("should return the specified date whose time has been set at midnight", () => {
			assert.equal(atMidnight(new Date(2000, 0, 1)).getTime(), new Date(2000, 0, 1).getTime());
			assert.equal(atMidnight(new Date(2001, 4, 3, 9, 28, 59)).getTime(), new Date(2001, 4, 3).getTime());
			assert.equal(atMidnight(new Date(2010, 8, 19, 13, 15, 9)).getTime(), new Date(2010, 8, 19).getTime());
			assert.equal(atMidnight(new Date(2020, 11, 31, 23, 59, 59)).getTime(), new Date(2020, 11, 31).getTime());
		});
	});

	describe("getDaysInMonth()", () => {
		it("should return the number of days in the month of the given date", () => {
			assert.equal(getDaysInMonth(new Date(2000, 0, 1)), 31);
			assert.equal(getDaysInMonth(new Date(2008, 1, 1, 12)), 29);
			assert.equal(getDaysInMonth(new Date(2009, 1, 1, 12)), 28);
			assert.equal(getDaysInMonth(new Date(2009, 3, 1, 20, 30, 15)), 30);
			assert.equal(getDaysInMonth(new Date(2024, 11, 31, 23, 59, 59)), 31);
		});
	});

	describe("getQuarter()", () => {
		it("should return the quarter number for the given date", () => {
			assert.equal(getQuarter(new Date(2015, 11, 31)), 4);
			assert.equal(getQuarter(new Date(2017, 6, 14)), 3);
			assert.equal(getQuarter(new Date(2020, 4, 3)), 2);
			assert.equal(getQuarter(new Date(2023, 0, 1)), 1);
			assert.equal(getQuarter(new Date(2024, 1, 29)), 1);
		});
	});

	describe("getWeekOfYear()", () => {
		it("should return the week number for the given date", () => {
			assert.equal(getWeekOfYear(new Date(2015, 11, 31)), 53);
			assert.equal(getWeekOfYear(new Date(2017, 6, 14)), 28);
			assert.equal(getWeekOfYear(new Date(2020, 4, 3)), 18);
			assert.equal(getWeekOfYear(new Date(2023, 0, 1)), 52);
			assert.equal(getWeekOfYear(new Date(2024, 1, 29)), 9);
		});
	});
});
