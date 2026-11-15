import {capitalize, truncate} from "@cedx/ui/String.js";

/**
 * Tests the features of the string functions.
 */
describe("String", () => {
	const culture = "fr-FR";

	describe("capitalize()", () => {
		it("should convert in uppercase the first character of the specified string", () => {
			capitalize("", culture).should.equal("");
			capitalize("foo bAr baZ", culture).should.equal("Foo bAr baZ");
		});
	});

	describe("truncate()", () => {
		it("should truncate the string to the specified length", () => {
			truncate("", 0).should.equal("");
			truncate("foo bar", 7).should.equal("foo bar");
			truncate("foo bar", 0).should.equal("...");
			truncate("foo bar", 4).should.equal("foo ...");
		});

		it("should append the specified ellipsis to the truncated string", () => {
			truncate("foo bar", 0, "--").should.equal("--");
			truncate("foo bar", 4, "--").should.equal("foo --");
		});
	});
});
