/* eslint-disable max-lines-per-function */
import {Sort, SortOrder} from "@cedx/ui/Sort.js";
import {assert} from "chai";

/**
 * Tests the features of the {@link Sort} class.
 */
describe("Sort", () => {
	describe("keys", () => {
		const sort = new Sort;

		it("should return an empty array for an empty sort", () =>
			assert.isEmpty(sort.keys));

		it("should return the property list for a non-empty sort", () => {
			sort.add("foo", SortOrder.Ascending);
			sort.add("bar", SortOrder.Descending);
			assert.sameOrderedMembers(sort.keys, ["foo", "bar"]);
		});
	});

	describe("length", () => {
		const sort = new Sort;

		it("should increment when adding an entry", () => {
			assert.lengthOf(sort, 0);
			sort.add("foo", SortOrder.Ascending);
			assert.lengthOf(sort, 1);
			sort.add("bar", SortOrder.Descending);
			assert.lengthOf(sort, 2);
		});

		it("should decrement when removing an entry", () => {
			sort.remove("foo");
			assert.lengthOf(sort, 1);
		});
	});

	describe("[Symbol.iterator]()", () => {
		it("should end iteration immediately if the sort is empty", () => {
			const iterator = new Sort()[Symbol.iterator]();
			assert.isTrue(iterator.next().done);
		});

		// TODO
		// it("should iterate over the entries if the sort is not empty", () => {
		// 	const iterator = Sort.of("foo").insert("bar", SortOrder.Descending)[Symbol.iterator]();
		// 	let next = iterator.next();
		// 	assert.isTrue(!next.done);
		// 	assert.deepEqual(next.value, ["bar", SortOrder.Descending]);
		// 	next = iterator.next();
		// 	assert.isFalse(next.done);
		// 	assert.deepEqual(next.value, ["foo", SortOrder.Ascending]);
		// 	assert.isTrue(iterator.next().done);
		// });
	});

	describe("add()", () => {
		const sort = Sort.of("foo");

		it("should append a new property to the end", () => {
			sort.add("bar", SortOrder.Ascending);
			assert.deepEqual(Array.from(sort), [["foo", SortOrder.Ascending], ["bar", SortOrder.Ascending]]);
		});

		it("should throw an error if a property with the same name already exists", () => {
			assert.throws(() => sort.add("foo", SortOrder.Descending));
		});
	});

	// TODO
	// describe("clear()", () => {
	// 	const sort = Sort.of("foo");

	// 	it("should prepend a new entry to the start", () => {
	// 		sort.clear("bar", SortOrder.Ascending);
	// 		assert.deepEqual(Array.from(sort), [["bar", SortOrder.Ascending], ["foo", SortOrder.Ascending]]);
	// 	});

	// 	it("should move an existing entry to the start and update its value", () => {
	// 		sort.clear("foo", SortOrder.Descending);
	// 		assert.deepEqual(Array.from(sort), [["foo", SortOrder.Descending], ["bar", SortOrder.Ascending]]);
	// 	});
	// });

	describe("compare()", () => {
		const x = {index: 1, name: "abc", type: "object"};
		const y = {index: 2, name: "xyz", type: "object"};

		it("should return zero if the two objects are considered equal", () => {
			assert.equal(Sort.of("type").compare(x, y), 0);
			assert.equal(Sort.of("type", SortOrder.Descending).compare(x, y), 0);
		});

		it("should return a negative number if the first object is before the second", () => {
			assert.isBelow(Sort.of("index").compare(x, y), 0);
			assert.isBelow(Sort.of("name").compare(x, y), 0);
			assert.isBelow(new Sort([["type", SortOrder.Ascending], ["index", SortOrder.Ascending]]).compare(x, y), 0);
		});

		it("should return a positive number if the first object is after the second", () => {
			assert.isAbove(Sort.of("index", SortOrder.Descending).compare(x, y), 0);
			assert.isAbove(Sort.of("name", SortOrder.Descending).compare(x, y), 0);
			assert.isAbove(new Sort([["type", SortOrder.Descending], ["index", SortOrder.Descending]]).compare(x, y), 0);
		});
	});

	describe("containsKey()", () => {
		const sort = Sort.of("foo");
		it("should return `true` for an existing entry", () => assert.isTrue(sort.containsKey("foo")));
		it("should return `false` for an unknown entry", () => assert.isFalse(sort.containsKey("bar")));
	});

	describe("get()", () => {
		const sort = Sort.of("foo");
		it("should return the corresponding order for an existing entry", () => assert.equal(sort.get("foo"), SortOrder.Ascending));
		it("should return `null` for an unknown entry", () => assert.isNull(sort.get("bar")));
	});

	describe("getAt()", () => {
		const sort = Sort.of("foo");
		it("should return the entry at the specified index", () => assert.deepEqual(sort.getAt(0), ["foo", SortOrder.Ascending]));
		it("should return `null` for an unknown entry", () => assert.isNull(sort.getAt(1)));
	});

	describe("getIcon()", () => {
		it("should return the icon corresponding to the sort order", () => {
			assert.equal(Sort.of("foo").getIcon("foo"), "arrow_upward");
			assert.equal(Sort.of("foo", SortOrder.Descending).getIcon("foo"), "arrow_downward");
			assert.equal(new Sort().getIcon("foo"), "swap_vert");
		});
	});

	describe("indexOf()", () => {
		const sort = new Sort([["foo", SortOrder.Ascending], ["bar", SortOrder.Descending]]);

		it("should return the index of an existing entry", () => {
			assert.equal(sort.indexOf("foo"), 0);
			assert.equal(sort.indexOf("bar"), 1);
		});

		it("should return `-1` for an unknown entry", () => assert.equal(sort.indexOf("qux"), -1));
	});

	// TODO
	// describe("insert()", () => {
	// 	const sort = Sort.of("foo");

	// 	it("should prepend a new entry to the start", () => {
	// 		sort.insert("bar", SortOrder.Ascending);
	// 		assert.deepEqual(Array.from(sort), [["bar", SortOrder.Ascending], ["foo", SortOrder.Ascending]]);
	// 	});

	// 	it("should move an existing entry to the start and update its value", () => {
	// 		sort.insert("foo", SortOrder.Descending);
	// 		assert.deepEqual(Array.from(sort), [["foo", SortOrder.Descending], ["bar", SortOrder.Ascending]]);
	// 	});
	// });

	describe("parse()", () => {
		it("should return an empty sort for an empty string", () =>
			assert.isEmpty(Array.from(Sort.parse(""))));

		it("should return an ascending order for a property without prefix", () =>
			assert.deepEqual(Array.from(Sort.parse("foo")), [["foo", SortOrder.Ascending]]));

		it("should return a descending order for a property with a '-' prefix", () =>
			assert.deepEqual(Array.from(Sort.parse("foo,-bar")), [["foo", SortOrder.Ascending], ["bar", SortOrder.Descending]]));
	});

	describe("remove()", () => {
		it("should properly remove entries", () => {
			const sort = new Sort([["foo", SortOrder.Ascending], ["bar", SortOrder.Descending]]);
			sort.remove("foo");
			assert.deepEqual(Array.from(sort), [["bar", SortOrder.Descending]]);
			sort.remove("bar");
			assert.isEmpty(Array.from(sort));
		});
	});

	describe("removeAt()", () => {
		it("should properly remove entries", () => {
			const sort = new Sort([["foo", SortOrder.Descending], ["bar", SortOrder.Ascending]]);
			sort.removeAt(1);
			assert.deepEqual(Array.from(sort), [["foo", SortOrder.Descending]]);
			sort.removeAt(0);
			assert.isEmpty(Array.from(sort));
		});
	});

	describe("set()", () => {
		const sort = new Sort;

		it("should append a new entry when setting an unknown property", () => {
			sort.set("foo", SortOrder.Ascending);
			assert.deepEqual(Array.from(sort), [["foo", SortOrder.Ascending]]);
		});

		it("should keep the order of entries when setting a known property", () => {
			sort.set("bar", SortOrder.Ascending);
			sort.set("foo", SortOrder.Descending);
			assert.deepEqual(Array.from(sort), [["foo", SortOrder.Descending], ["bar", SortOrder.Ascending]]);
		});
	});

	// TODO
	// describe("setAt()", () => {
	// 	const sort = Sort.of("foo");

	// 	it("should prepend a new entry to the start", () => {
	// 		sort.setAt("bar", SortOrder.Ascending);
	// 		assert.deepEqual(Array.from(sort), [["bar", SortOrder.Ascending], ["foo", SortOrder.Ascending]]);
	// 	});

	// 	it("should move an existing entry to the start and update its value", () => {
	// 		sort.setAt("foo", SortOrder.Descending);
	// 		assert.deepEqual(Array.from(sort), [["foo", SortOrder.Descending], ["bar", SortOrder.Ascending]]);
	// 	});
	// });

	describe("toString()", () => {
		it("should return an empty string for an empty sort", () =>
			assert.isEmpty(String(new Sort)));

		it("should return the property for an ascending order", () =>
			assert.equal(String(Sort.of("foo")), "foo"));

		it("should return the property with a '-' prefix for a descending order", () =>
			assert.equal(String(Sort.parse("foo,-bar")), "foo,-bar"));
	});
});
