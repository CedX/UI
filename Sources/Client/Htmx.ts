import htmx, {type HtmxEventMap} from "htmx.org";
export const Htmx = htmx as unknown as typeof htmx.default;

/**
 * Provides details about the `htmx:confirm` event.
 */
export type HtmxConfirmEventArgs = HtmxEventMap["htmx:confirm"] & {

	/**
	 * The message passed to the `hx-confirm` attribute.
	 */
	ctx: {confirm: string};
};
