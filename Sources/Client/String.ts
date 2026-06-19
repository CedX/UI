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
 * Truncates the specified string to the given number of characters.
 * @param value The string to be truncated.
 * @param length The maximum length.
 * @param ellipsis The ellipsis to append to the truncated text.
 * @returns The truncated string.
 */
export function truncate(value: string, length: number, ellipsis = "..."): string {
	return value.length > length ? value.slice(0, length) + ellipsis : value;
}
