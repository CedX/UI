import {Computed, Signal as State} from "@preact/signals-core";
export {effect, Computed, type EffectOptions, Signal as State} from "@preact/signals-core";

/**
 * Creates reactive primitives.
 */
export const Signal = Object.freeze({

	/**
	 * Creates a new computed signal.
	 */
	Computed,

	/**
	 * Creates a new plain signal.
	 */
	State
});
