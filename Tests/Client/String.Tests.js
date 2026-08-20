import {capitalize, truncate} from "@cedx/ui/String.js";
import {assert} from "chai";

/**
 * Tests the features of the string functions.
 */
describe("String", () => {
	const culture = "fr-FR";

	describe("capitalize()", () => {
		it("should convert in uppercase the first character of the specified string", () => {
			assert.equal(capitalize("", culture), "");
			assert.equal(capitalize("foo bAr baZ", culture), "Foo bAr baZ");
		});
	});

	describe("chunk()", () => {
		it("should split the string into chunks of the specified length", () => {
			assert.deepEqual(chunk(""), []);
			assert.deepEqual(chunk("héhé", 1), ["h", "é", "h", "é"]);
			assert.deepEqual(chunk("foo", 2), ["fo", "o"]);
			assert.deepEqual(chunk("foobar", 3), ["foo", "bar"]);
			assert.deepEqual(chunk("foo", 4), ["foo"]);
		});
	});

	describe("truncate()", () => {
		it("should truncate the string to the specified length", () => {
			assert.equal(truncate("", 0), "");
			assert.equal(truncate("foo bar", 7), "foo bar");
			assert.equal(truncate("foo bar", 0), "...");
			assert.equal(truncate("foo bar", 4), "foo ...");
		});

		it("should append the specified ellipsis to the truncated string", () => {
			assert.equal(truncate("foo bar", 0, "--"), "--");
			assert.equal(truncate("foo bar", 4, "--"), "foo --");
		});
	});
});
