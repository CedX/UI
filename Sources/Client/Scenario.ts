/**
 * Defines the scenario used in data validation.
 */
export const Scenario = Object.freeze({
	Create: "Create",
	Delete: "Delete",
	Read: "Read",
	Update: "Update"
});

/**
 * Defines the scenario used in data validation.
 */
export type Scenario = typeof Scenario[keyof typeof Scenario];
