/**
 * Defines the size of an element.
 */
export const Size = Object.freeze({
	ExtraSmall: "ExtraSmall",
	Small: "Small",
	Medium: "Medium",
	Large: "Large",
	ExtraLarge: "ExtraLarge",
	ExtraExtraLarge: "ExtraExtraLarge"
});

/**
 * Defines the size of an element.
 */
export type Size = typeof Size[keyof typeof Size];

/**
 * Returns the CSS class of the specified size.
 * @param size The size.
 * @returns The CSS class of the specified size.
 */
export function getCssClass(size: Size): string {
	switch (size) {
		case Size.ExtraSmall: return "xs";
		case Size.Small: return "sm";
		case Size.Large: return "lg";
		case Size.ExtraLarge: return "xl";
		case Size.ExtraExtraLarge: return "xxl";
		default: return "md";
	}
}
