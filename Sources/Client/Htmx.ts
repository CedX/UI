import htmx, {type HtmxResponseInfo} from "htmx.org";
export const Htmx = htmx as unknown as typeof htmx.default;

/**
 * Provides details about an `htmx` event.
 */
export type HtmxEventArgs = HtmxResponseInfo & {

	/**
	 * The element involved in the operation that just occurred.
	 */
	elt: Element;
};

/**
 * Provides details about the `htmx:confirm` event.
 */
export type HtmxConfirmEventArgs = HtmxEventArgs & {

	/**
	 * Issues the actual AJAX request.
	 * @param skipConfirmation Value indicating whether to skip the built-in confirmation dialog.
	 */
	issueRequest: (skipConfirmation?: boolean) => void;

	/**
	 * The question passed to the `hx-confirm` attribute.
	 */
	question?: string;

	/**
	 * The event that triggered the original request.
	 */
	triggeringEvent: Event;
};
