import {Pagination, type PaginationOptions} from "./Pagination.js";

/**
 * A list with information relevant to the pagination of its items.
 */
export class PaginatedList<T> {

	/**
	 * The list items.
	 */
	items: T[];

	/**
	 * The information relevant to the pagination.
	 */
	pagination: Pagination;

	/**
	 * Creates a new paginated list.
	 * @param options An object providing values to initialize this instance.
	 */
	constructor(options: PaginatedListOptions<T> = {}) {
		this.items = options.items ?? [];
		this.pagination = new Pagination(options.pagination ?? {});
	}

	/**
	 * Creates an empty paginated list.
	 * @param itemsPerPage The number of items per page.
	 * @returns An empty paginated list with the specified number of items per page.
	 */
	static empty<T>(itemsPerPage: number): PaginatedList<T> {
		return new this({pagination: new Pagination({itemsPerPage})});
	}
}

/**
 * Defines the options of a {@link PaginatedList} instance.
 */
export type PaginatedListOptions<T> = Partial<{

	/**
	 * The list items.
	 */
	items: T[];

	/**
	 * The information relevant to the pagination of list items.
	 */
	pagination: PaginationOptions;
}>;
