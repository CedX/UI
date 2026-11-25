import {getInvalidControl, isControl, resetValidity, trimControl} from "@cedx/ui/Form.js";

/**
 * Tests the features of the form functions.
 */
describe("Form", () => {
	describe("getInvalidControl()", () => {
		const form = document.createElement("form");
		const input = document.createElement("input");
		const textarea = document.createElement("textarea");
		form.appendChild(input);
		form.appendChild(textarea);

		it("should return the first invalid control if it exists", () => {
			input.setCustomValidity("error");
			textarea.setCustomValidity("");
			should.equal(getInvalidControl(form), input)

			input.setCustomValidity("");
			textarea.setCustomValidity("error");
			should.equal(getInvalidControl(form), textarea)
		});

		it("should return `null` if all form controls are valid", () => {
			input.setCustomValidity("");
			textarea.setCustomValidity("");
			should.not.exist(getInvalidControl(form));
		});
	});

	describe("isControl()", () => {
		it("should return `true` if the specified element is a form control", () => {
			isControl(document.createElement("input")).should.be.true;
			isControl(document.createElement("select")).should.be.true;
			isControl(document.createElement("textarea")).should.be.true;
		});

		it("should return `false` if the specified element is a not form control", () => {
			isControl(document.createElement("button")).should.be.false;
			isControl(document.createElement("div")).should.be.false;
			isControl(document.createElement("fieldset")).should.be.false;
		});
	});

	describe("resetValidity()", () => {
		it("should reset the validity state of a single form element", () => {
			const input = document.createElement("input");

			input.setCustomValidity("error");
			input.checkValidity().should.be.false;

			resetValidity(input);
			input.checkValidity().should.be.true;
		});

		it("should reset the validity state of all elements of a form", () => {
			const form = document.createElement("form");

			const input = document.createElement("input");
			input.setCustomValidity("error");
			form.appendChild(input);

			const textarea = document.createElement("textarea");
			textarea.setCustomValidity("error");
			form.appendChild(textarea);

			input.checkValidity().should.be.false;
			textarea.checkValidity().should.be.false;
			form.checkValidity().should.be.false;

			resetValidity(form);
			input.checkValidity().should.be.true;
			textarea.checkValidity().should.be.true;
			form.checkValidity().should.be.true;
		});
	});

	describe("trimControl()", () => {
		it("should trim the value of a single form element", () => {
			const input = document.createElement("input");
			input.value = " \t Foo Bar \r\n ";
			trimControl(input);
			input.value.should.equal("Foo Bar");
		});

		it("should trim the value of all elements of a form", () => {
			const form = document.createElement("form");

			const input = document.createElement("input");
			input.value = " \t Foo Bar \r\n ";
			form.appendChild(input);

			const textarea = document.createElement("textarea");
			textarea.value = " \t Baz Qux \r\n ";
			form.appendChild(textarea);

			trimControl(form);
			input.value.should.equal("Foo Bar");
			textarea.value.should.equal("Baz Qux");
		});
	});
});
