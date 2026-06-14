/**
 * Specifies the order of a sort property.
 */
export const SortOrder = Object.freeze({

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
 * Specifies the order of a sort property.
 */
export type SortOrder = typeof SortOrder[keyof typeof SortOrder];

/**
 * Holds the name of a property and the order to sort by.
 */
export type SortProperty = [string, SortOrder];

/**
 * Represents information relevant to the sorting of data items.
 */
export class Sort implements Iterable<SortProperty> {

	/**
	 * The list of sort properties.
	 */
	#properties: SortProperty[];

	/**
	 * Creates new sort.
	 * @param properties The list of properties to be sorted.
	 */
	constructor(properties: SortProperty[] = []) {
		this.#properties = properties;
	}

	/**
	 * The list of sort properties.
	 */
	get keys(): string[] {
		return this.#properties.map(item => item[0]);
	}

	/**
	 * The number of properties in this sort.
	 */
	get length(): number {
		return this.#properties.length;
	}

	/**
	 * Creates a new sort from the specified property and order.
	 * @param property The property name.
	 * @param order The sort order.
	 * @returns The sort corresponding to the property and order.
	 */
	static of(property: string, order: SortOrder = SortOrder.Ascending): Sort {
		return new this([[property, order]]);
	}

	/**
	 * Creates a new sort from the specified string.
	 * @param value A string representing a sort.
	 * @returns The sort corresponding to the specified string.
	 */
	static parse(value: string): Sort {
		return new this((value ? value.split(",") : []).map(token => {
			const order = token.startsWith("-") ? SortOrder.Descending : SortOrder.Ascending;
			return [order == SortOrder.Ascending ? token : token.slice(1), order];
		}));
	}

	/**
	 * Returns a new iterator that allows iterating the entries of this sort.
	 * @returns An iterator over the sort properties.
	 */
	[Symbol.iterator](): Iterator<SortProperty> {
		return this.#properties[Symbol.iterator]();
	}

	/**
	 * Appends the specified property to this sort.
	 * @param property The property name.
	 * @param order The sort order.
	 * @throws `Error` when an element with the same property name already exists.
	 */
	add(property: string, order: SortOrder): void {
		if (this.containsKey(property)) throw new Error("An element with the same property name already exists.");
		this.#properties.push([property, order]);
	}

	/**
	 * Removes all properties from this sort.
	 */
	clear(): void {
		this.#properties = [];
	}

	/**
	 * Compares the specified objects, according to the current sort properties.
	 * @param x The first object to compare.
	 * @param y The second object to compare.
	 * @returns A value indicating the relationship between the two objects.
	 */
	compare(x: object, y: object): number {
		for (const [property, order] of this.#properties) {
			const xAttr = Reflect.get(x, property); // eslint-disable-line @typescript-eslint/no-unsafe-assignment
			const yAttr = Reflect.get(y, property); // eslint-disable-line @typescript-eslint/no-unsafe-assignment
			const value = xAttr > yAttr ? 1 : (xAttr < yAttr ? -1 : 0);
			if (value) return order == SortOrder.Ascending ? value : -value;
		}

		return 0;
	}

	/**
	 * Returns a value indicating whether the specified property exists in this sort.
	 * @param property The property name.
	 * @returns `true` if the specified property exists in this sort, otherwise `false`.
	 */
	containsKey(property: string): boolean {
		return this.#properties.some(([key]) => key == property);
	}

	/**
	 * Gets the order associated with the specified property.
	 * @param property The property name.
	 * @returns The order associated with the specified property, or `null` if the property doesn't exist.
	 */
	get(property: string): SortOrder|null {
		for (const [key, order] of this.#properties) if (key == property) return order;
		return null;
	}

	/**
	 * Gets the sort property at the specified index.
	 * @param index The position in this sort.
	 * @returns The sort property at the specified index, or `null` if it doesn't exist.
	 */
	getAt(index: number): SortProperty|null {
		return this.#properties.at(index) ?? null;
	}

	/**
	 * Gets the icon corresponding to the specified property.
	 * @param property The property name.
	 * @returns The icon corresponding to the specified property.
	 */
	getIcon(property: string): string {
		switch (this.get(property)) {
			case SortOrder.Ascending: return "arrow_upward";
			case SortOrder.Descending: return "arrow_downward";
			default: return "swap_vert";
		}
	}

	/**
	 * Gets the index of the specified property in the underlying list.
	 * @param property The property name.
	 * @returns The index of the specified property, or `-1` if the property is not found.
	 */
	indexOf(property: string): number {
		for (const [index, [key]] of this.#properties.entries()) if (key == property) return index;
		return -1;
	}

	/**
	 * Inserts the specified property into this sort at the specified index.
	 * @param index The position in this sort.
	 * @param property The property name.
	 * @param order The sort order.
	 */
	insert(index: number, property: string, order: SortOrder): void {
		this.#properties.splice(index, 0, [property, order]);
	}

	/**
	 * Removes the specified property from this sort.
	 * @param property The property name.
	 */
	remove(property: string): void {
		this.#properties = this.#properties.filter(([key]) => key != property);
	}

	/**
	 * Removes the sort property at the specified index.
	 * @param index The position in this sort.
	 */
	removeAt(index: number): void {
		this.#properties.splice(index, 1);
	}

	/**
	 * Sets the order of the specified property.
	 * @param property The property name.
	 * @param order The sort order.
	 */
	set(property: string, order: SortOrder): void {
		for (const [index, [key]] of this.#properties.entries()) if (key == property) {
			this.#properties[index] = [key, order];
			return;
		}

		this.add(property, order);
	}

	/**
	 * Sets the sort property at the specified index.
	 * @param index The position in this sort.
	 * @param property The property name.
	 * @param order The sort order.
	 */
	setAt(index: number, property: string, order: SortOrder): void {
		this.#properties[index] = [property, order];
	}

	/**
	 * Returns a JSON representation of this object.
	 * @returns The JSON representation of this object.
	 */
	toJSON(): string {
		return this.toString();
	}

	/**
	 * Returns a string representation of this object.
	 * @returns The string representation of this object.
	 */
	toString(): string {
		return this.#properties.map(([property, order]) => `${order == SortOrder.Descending ? "-" : ""}${property}`).join(",");
	}
}
