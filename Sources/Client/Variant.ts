import {Context} from "./Context.js";

/**
 * Defines tone variants.
 */
export const Variant = Object.freeze({
	...Context,
	Primary: "Primary",
	Secondary: "Secondary",
	Light: "Light",
	Dark: "Dark"
});

/**
 * Defines tone variants.
 */
export type Variant = typeof Variant[keyof typeof Variant];

/**
 * Returns the CSS class of the specified variant.
 * @param variant The variant.
 * @returns The CSS class of the specified variant.
 */
export function getCssClass(variant: Variant): string {
	return variant.toLowerCase();
}
