/**
 * Defines the alignment of a component.
 */
export const Alignment = Object.freeze({
	Start: "Start",
	Center: "Center",
	End: "End"
});

/**
 * Defines the alignment of a component.
 */
export type Alignment = typeof Alignment[keyof typeof Alignment];
