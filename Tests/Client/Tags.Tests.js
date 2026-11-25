import {css, html} from "@cedx/ui/Tags.js";

/**
 * Tests the features of the tag functions.
 */
describe("Tags", () => {
	describe("css()", () => {
		it("should create a CSS stylesheet", () => {
			const cssStyleSheet = css`p { display: block; } /* A comment. */ button.btn { color: black; }`;
			cssStyleSheet.should.be.instanceOf(CSSStyleSheet);
			cssStyleSheet.cssRules.should.have.lengthOf(2);

			const {cssRules} = cssStyleSheet;
			cssRules.item(0)?.cssText.should.equal("p { display: block; }");
			cssRules.item(1)?.cssText.should.equal("button.btn { color: black; }");
		});

		it("should support nested CSS stylesheets", () => {
			const cssStyleSheet = css`${css`p { display: block; }`} /* A comment. */ ${css`button.btn { color: black; }`}`;
			cssStyleSheet.cssRules.should.have.lengthOf(2);

			const {cssRules} = cssStyleSheet;
			cssRules.item(0)?.cssText.should.equal("p { display: block; }");
			cssRules.item(1)?.cssText.should.equal("button.btn { color: black; }");
		});

		it("should support arrays of CSS stylesheets", () => {
			const cssStyleSheet = css`${["green", "red"].map(item => css`.bg-${item} { background: ${item}; }`)}`;
			cssStyleSheet.cssRules.should.have.lengthOf(2);

			const {cssRules} = cssStyleSheet;
			cssRules.item(0)?.cssText.should.equal(".bg-green { background: green; }");
			cssRules.item(1)?.cssText.should.equal(".bg-red { background: red; }");
		});
	});

	describe("html()", () => {
		it("should create a document fragment", () => {
			const documentFragment = html`<p>Hello World!</p> <!-- A comment. --> <button class="btn">OK</button>`;
			documentFragment.should.be.instanceOf(DocumentFragment);
			documentFragment.childNodes.should.have.lengthOf(5);

			const paragraph = documentFragment.childNodes.item(0);
			paragraph.should.be.instanceOf(HTMLParagraphElement);
			should.equal(paragraph.textContent, "Hello World!");

			const button = /** @type {HTMLButtonElement} */ (documentFragment.childNodes.item(4));
			button.should.be.instanceOf(HTMLButtonElement);
			should.equal(button.className, "btn");
		});

		it("should support nested document fragments", () => {
			const documentFragment = html`${html`<p>Hello World!</p>`} <!-- A comment. --> ${html`<button class="btn">OK</button>`}`;
			documentFragment.childNodes.should.have.lengthOf(5);

			const {childNodes} = documentFragment;
			childNodes.item(0).should.be.instanceOf(HTMLParagraphElement);
			childNodes.item(2).should.be.instanceOf(Comment);
			childNodes.item(4).should.be.instanceOf(HTMLButtonElement);
		});

		it("should support arrays of document fragments", () => {
			const documentFragment = html`${["Hello", "World!"].map(item => html`<span>${item}</span>`)}`;
			documentFragment.childNodes.should.have.lengthOf(2);

			const {childNodes} = documentFragment;
			should.equal(childNodes.item(0).textContent, "Hello");
			should.equal(childNodes.item(1).textContent, "World!");
		});
	});
});
