/**
 * Specifies the direction of a sorted property.
 */
export const SortDirection = Object.freeze({

	/**
	 * The sort is ascending.
	 */
	Ascending: "Ascending",

	/**
	 * The sort is descending.
	 */
	Descending: "Descending"
});

/**
 * Specifies the direction of a sorted property.
 */
export type SortDirection = typeof SortDirection[keyof typeof SortDirection];
