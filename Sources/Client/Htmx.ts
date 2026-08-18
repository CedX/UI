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
export type HtmxConfirmEventDetail = HtmxEventDetail & {

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

/**
 * Returns a value indicating whether the specified response failed.
 * @param response The `htmx` response.
 * @returns `true` if the specified response failed, otherwise `false`.
 */
export function failed(response: HtmxResponseInfo): boolean {
	const {status} = response.xhr;
	return Boolean(response.failed) || (status >= 400 && status < 600);
}

/**
 * Returns a value indicating whether the specified response was successful.
 * @param response The `htmx` response.
 * @returns `true` if the specified response was successful, otherwise `false`.
 */
export function successful(response: HtmxResponseInfo): boolean {
	const {status} = response.xhr;
	return Boolean(response.successful) || (status >= 200 && status < 300);
}
