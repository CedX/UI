/**
 * Converts the first character of the specified string to uppercase.
 * @param value The string to process.
 * @param culture The current culture.
 * @returns The processed string.
 */
export function capitalize(value: string, culture: Intl.Locale|string = navigator.language): string {
	return value.length ? value.charAt(0).toLocaleUpperCase(culture) + value.slice(1) : "";
}

/**
 * Splits the characters of a string into chunks of size at most {@link size}.
 * @param value The string to chunk.
 * @param size The maximum size of each chunk.
 * @returns An array that contains the characters the input string split into chunks of size {@link size}.
 */
export function chunk(value: string, size = 1): string[] {
	return size == 1 ? Array.from(value) : (value.match(new RegExp(`.{1,${size}}`, "gsy")) ?? []);
}

/**
 * Truncates the specified string to the given number of characters.
 * @param value The string to be truncated.
 * @param length The maximum length.
 * @param ellipsis The ellipsis to append to the truncated text.
 * @returns The truncated string.
 */
export function truncate(value: string, length: number, ellipsis = "..."): string {
	return value.length > length ? value.slice(0, length) + ellipsis : value;
}
