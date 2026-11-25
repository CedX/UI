import {toDataUrl} from "@cedx/ui/File.js";

/**
 * Tests the features of the file functions.
 */
describe("File", () => {
	describe("toDataUrl()", () => {
		it("should convert the specified file to a data URL", async () => {
			const file = new File(["Hello World!"], "hello.txt", {type: "text/plain"});
			(await toDataUrl(file)).href.should.equal("data:text/plain;base64,SGVsbG8gV29ybGQh");
		});
	});
});
