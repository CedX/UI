import {Context} from "../Context.js";
import {Position, cssClass} from "../Position.js";
import {html} from "../Tags.js";
import "./Toast.js";
import type {IToast, Toast} from "./Toast.js"; // eslint-disable-line no-duplicate-imports

/**
 * Provides details about the `ui:toaster:notify` event.
 */
export interface IToasterEventArgs {

	/**
	 * The title displayed in the header.
	 */
	caption?: string;

	/**
	 * The contextual modifier.
	 */
	context?: Context;

	/**
	 * The child content displayed in the body.
	 */
	message: string;
}

/**
 * Manages the notifications.
 */
export class Toaster extends HTMLElement {

	/**
	 * The list of observed attributes.
	 */
	static readonly observedAttributes = ["position"];

	/**
	 * The template for a toast.
	 */
	readonly #toastTemplate = this.querySelector("template")!.content;

	/**
	 * Creates a new toaster.
	 */
	constructor() {
		super();
		for (const toast of this.querySelectorAll("toaster-item")) toast.addEventListener("hidden.bs.toast", () => toast.remove());
	}

	/**
	 * Registers the component.
	 */
	static {
		customElements.define("toaster-container", this);
	}

	/**
	 * Value indicating whether to automatically hide the toasts.
	 */
	get autoHide(): boolean {
		return this.hasAttribute("autohide");
	}
	set autoHide(value: boolean) {
		this.toggleAttribute("autohide", value);
	}

	/**
	 * The default contextual modifier.
	 */
	get context(): Context {
		const value = this.getAttribute("context") as Context;
		return Object.values(Context).includes(value) ? value : Context.Info;
	}
	set context(value: Context) {
		this.setAttribute("context", value);
	}

	/**
	 * The default culture used to format the relative times.
	 */
	get culture(): Intl.Locale {
		const value = this.getAttribute("culture") ?? "";
		return new Intl.Locale(value.trim() || navigator.language);
	}
	set culture(value: Intl.Locale) {
		this.setAttribute("culture", value.toString());
	}

	/**
	 * The default delay, in milliseconds, to hide the toasts.
	 */
	get delay(): number {
		const value = Number(this.getAttribute("delay"));
		return Math.max(0, Number.isNaN(value) ? 5_000 : value);
	}
	set delay(value: number) {
		this.setAttribute("delay", value.toString());
	}

	/**
	 * Value indicating whether to apply a transition.
	 */
	get fade(): boolean {
		return this.hasAttribute("fade");
	}
	set fade(value: boolean) {
		this.toggleAttribute("fade", value);
	}

	/**
	 * The default icon displayed next to the captions.
	 */
	get icon(): string|null {
		const value = this.getAttribute("icon") ?? "";
		return value.trim() || null;
	}
	set icon(value: string|null) {
		if (value) this.setAttribute("icon", value);
		else this.removeAttribute("icon");
	}

	/**
	 * The toaster placement.
	 */
	get position(): Position {
		const value = this.getAttribute("position") as Position;
		return Object.values(Position).includes(value) ? value : Position.BottomEnd;
	}
	set position(value: Position) {
		this.setAttribute("position", value);
	}

	/**
	 * Method invoked when an attribute has been changed.
	 * @param attribute The attribute name.
	 * @param oldValue The previous attribute value.
	 * @param newValue The new attribute value.
	 */
	attributeChangedCallback(attribute: string, oldValue: string|null, newValue: string|null): void {
		if (newValue != oldValue) switch (attribute) {
			case "position": this.#updatePosition(Object.values(Position).includes(newValue as Position) ? newValue as Position : Position.BottomEnd); break;
			// No default
		}
	}

	/**
	 * Shows a toast.
	 * @param context The contextual modifier.
	 * @param caption The title displayed in the header.
	 * @param message The child content displayed in the body.
	 * @returns The newly created toast.
	 */
	notify(context: Context, caption: string, message: DocumentFragment): Toast {
		return this.show({body: message, caption, context});
	}

	/**
	 * Shows a toast.
	 * @param toast The toast to show.
	 * @returns The newly created toast.
	 */
	show(toast: IToast): Toast {
		const item = document.createElement("toaster-item");
		const childContent = (this.#toastTemplate.cloneNode(true) as DocumentFragment).querySelector(".toast")!;
		childContent.addEventListener("hidden.bs.toast", () => item.remove());
		item.appendChild(childContent);

		item.autoHide = toast.autoHide ?? this.autoHide;
		item.body = toast.body;
		item.caption = toast.caption;
		item.context = toast.context ?? this.context;
		item.culture = toast.culture ?? this.culture;
		item.delay = toast.delay ?? this.delay;
		item.fade = toast.fade ?? this.fade;
		item.icon = toast.icon ?? this.icon;

		this.firstElementChild!.appendChild(item);
		item.show();
		return item;
	}

	/**
	 * Registers this toaster as a listener for the `ui:toaster:notify` event.
	 * @returns An abort controller used to cancel the subscription to the `ui:toaster:notify` event.
	 */
	useNotifyEventHandler(): AbortController {
		const listener = (event: CustomEvent<IToasterEventArgs>): void => {
			const {caption, context, message} = event.detail;
			this.notify(context ?? Context.Info, caption ?? "", html`${message}`);
		};

		const abortController = new AbortController;
		document.body.addEventListener("ui:toaster:notify", listener as EventListener, {signal: abortController.signal});
		return abortController;
	}

	/**
	 * Updates the toaster placement.
	 * @param value The new value.
	 */
	#updatePosition(value: Position): void {
		const {classList} = this.firstElementChild!;
		classList.remove(...Object.values(Position).flatMap(position => cssClass(position).split(" ")));
		classList.add(...cssClass(value).split(" "));
	}
}

/**
 * Declaration merging.
 */
declare global {

	/**
	 * The map of HTML tag names.
	 */
	interface HTMLElementTagNameMap {
		"toaster-container": Toaster;
	}
}
