import {SortDirection} from "./SortDirection.js";

/**
 * Holds the name of a property and the direction to sort by.
 */
export type SortedProperty = [string, SortDirection];

/**
 * Represents information relevant to the sorting of data items.
 */
export class Sort implements Iterable<SortedProperty> {

	/**
	 * The list of sort properties.
	 */
	#properties: SortedProperty[];

	/**
	 * Creates new sort.
	 * @param properties The list of properties to be sorted.
	 * @param direction The sort direction.
	 */
	constructor(properties: string|SortedProperty[] = [], direction: SortDirection = SortDirection.Ascending) {
		this.#properties = typeof properties == "string" ? [[properties, direction]] : properties;
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
	 * Creates a new sort from the specified string.
	 * @param value A string representing a sort.
	 * @returns The sort corresponding to the specified string.
	 */
	static parse(value: string): Sort {
		return new this((value ? value.split(",") : []).map(token => {
			const direction = token.startsWith("-") ? SortDirection.Descending : SortDirection.Ascending;
			return [direction == SortDirection.Ascending ? token : token.slice(1), direction];
		}));
	}

	/**
	 * Returns a new iterator that allows iterating the entries of this sort.
	 * @returns An iterator over the sort properties.
	 */
	[Symbol.iterator](): Iterator<SortedProperty> {
		return this.#properties[Symbol.iterator]();
	}

	/**
	 * Appends the specified property to this sort.
	 * @param property The property name.
	 * @param direction The sort direction.
	 * @throws `Error` when a property with the same name already exists.
	 */
	add(property: string, direction: SortDirection): void {
		if (this.containsKey(property)) throw new Error("A property with the same name already exists.");
		this.#properties.push([property, direction]);
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
		for (const [property, direction] of this.#properties) {
			const xAttr = Reflect.get(x, property); // eslint-disable-line @typescript-eslint/no-unsafe-assignment
			const yAttr = Reflect.get(y, property); // eslint-disable-line @typescript-eslint/no-unsafe-assignment
			const value = xAttr > yAttr ? 1 : (xAttr < yAttr ? -1 : 0);
			if (value) return direction == SortDirection.Ascending ? value : -value;
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
	 * Gets the direction associated with the specified property.
	 * @param property The property name.
	 * @returns The direction associated with the specified property, or `null` if the property doesn't exist.
	 */
	get(property: string): SortDirection|null {
		for (const [key, direction] of this.#properties) if (key == property) return direction;
		return null;
	}

	/**
	 * Gets the sorted property at the specified index.
	 * @param index The position in this sort.
	 * @returns The sorted property at the specified index, or `null` if it doesn't exist.
	 */
	getAt(index: number): SortedProperty|null {
		return this.#properties.at(index) ?? null;
	}

	/**
	 * Gets the icon corresponding to the specified property.
	 * @param property The property name.
	 * @returns The icon corresponding to the specified property.
	 */
	getIcon(property: string): string {
		switch (this.get(property)) {
			case SortDirection.Ascending: return "arrow_upward";
			case SortDirection.Descending: return "arrow_downward";
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
	 * @param direction The sort direction.
	 */
	insert(index: number, property: string, direction: SortDirection): void {
		this.#properties.splice(index, 0, [property, direction]);
	}

	/**
	 * Removes the specified property from this sort.
	 * @param property The property name.
	 */
	remove(property: string): void {
		this.#properties = this.#properties.filter(([key]) => key != property);
	}

	/**
	 * Removes the sorted property at the specified index.
	 * @param index The position in this sort.
	 */
	removeAt(index: number): void {
		this.#properties.splice(index, 1);
	}

	/**
	 * Sets the direction of the specified property.
	 * @param property The property name.
	 * @param direction The sort direction.
	 */
	set(property: string, direction: SortDirection): void {
		for (const [index, [key]] of this.#properties.entries()) if (key == property) {
			this.#properties[index] = [key, direction];
			return;
		}

		this.add(property, direction);
	}

	/**
	 * Sets the sorted property at the specified index.
	 * @param index The position in this sort.
	 * @param property The property name.
	 * @param direction The sort direction.
	 * @throws `Error` when a property with the same name already exists at a different index.
	 */
	setAt(index: number, property: string, direction: SortDirection): void {
		const existingIndex = this.indexOf(property);
		if (existingIndex >= 0 && existingIndex != index) throw new Error("A property with the same name already exists at a different index.");
		this.#properties[index] = [property, direction];
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
		return this.#properties.map(([property, direction]) => `${direction == SortDirection.Descending ? "-" : ""}${property}`).join(",");
	}
}
