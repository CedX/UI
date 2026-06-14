import {effect, type EffectOptions} from "./Signal.js";

/**
 * The base class for signal-based custom elements.
 */
export abstract class Component extends HTMLElement {

	/**
	 * The list of effect disposers.
	 */
	#effects: Array<() => void> = [];

	/**
	 * Method invoked when this component is disconnected.
	 */
	disconnectedCallback(): void {
		for (const dispose of this.#effects) dispose();
		this.#effects = [];
	}

	/**
	 * Registers a new effect.
	 * @param handler The effect handler.
	 * @param options The effect options.
	 */
	useEffect(handler: (() => void) | (() => () => void), options?: EffectOptions): void {
		this.#effects.push(effect(handler, options));
	}
}
