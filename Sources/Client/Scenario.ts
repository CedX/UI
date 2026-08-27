/**
 * Defines the scenario used in data validation.
 */
export const Scenario = Object.freeze({

	/**
	 * A scenario in which the underlying model is created.
	 */
	Create: "Create",

	/**
	 * A scenario in which the underlying model is deleted.
	 */
	Delete: "Delete",

	/**
	 * A scenario in which the underlying model is read.
	 */
	Read: "Read",

	/**
	 * A scenario in which the underlying model is updated.
	 */
	Update: "Update"
});

/**
 * Defines the scenario used in data validation.
 */
export type Scenario = typeof Scenario[keyof typeof Scenario];
