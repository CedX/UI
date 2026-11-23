import {atMidnight, getDaysInMonth, getQuarter, getWeekOfYear} from "@cedx/ui/Date.js";

/**
 * Tests the features of the date functions.
 */
describe("Date", () => {
	describe("atMidnight()", () => {
		it("should return the specified date whose time has been set at midnight", () => {
			atMidnight(new Date(2000, 0, 1)).valueOf().should.equal(new Date(2000, 0, 1).valueOf());
			atMidnight(new Date(2000, 0, 1)).valueOf().should.equal(new Date(2000, 0, 1).valueOf());
			atMidnight(new Date(2001, 4, 3, 9, 28, 59)).valueOf().should.equal(new Date(2001, 4, 3).valueOf());
			atMidnight(new Date(2010, 8, 19, 13, 15, 9)).valueOf().should.equal(new Date(2010, 8, 19).valueOf());
			atMidnight(new Date(2020, 11, 31, 23, 59, 59)).valueOf().should.equal(new Date(2020, 11, 31).valueOf());
		});
	});

	describe("getDaysInMonth()", () => {
		it("should return the number of days in the month of the given date", () => {
			getDaysInMonth(new Date(2000, 0, 1)).should.equal(31);
			getDaysInMonth(new Date(2008, 1, 1, 12)).should.equal(29);
			getDaysInMonth(new Date(2009, 1, 1, 12)).should.equal(28);
			getDaysInMonth(new Date(2009, 3, 1, 20, 30, 15)).should.equal(30);
			getDaysInMonth(new Date(2024, 11, 31, 23, 59, 59)).should.equal(31);
		});
	});

	describe("getQuarter()", () => {
		it("should return the quarter number for the given date", () => {
			getQuarter(new Date(2015, 11, 31)).should.equal(4);
			getQuarter(new Date(2017, 6, 14)).should.equal(3);
			getQuarter(new Date(2020, 4, 3)).should.equal(2);
			getQuarter(new Date(2023, 0, 1)).should.equal(1);
			getQuarter(new Date(2024, 1, 29)).should.equal(1);
		});
	});

	describe("getWeekOfYear()", () => {
		it("should return the week number for the given date", () => {
			getWeekOfYear(new Date(2015, 11, 31)).should.equal(53);
			getWeekOfYear(new Date(2017, 6, 14)).should.equal(28);
			getWeekOfYear(new Date(2020, 4, 3)).should.equal(18);
			getWeekOfYear(new Date(2023, 0, 1)).should.equal(52);
			getWeekOfYear(new Date(2024, 1, 29)).should.equal(9);
		});
	});
});
