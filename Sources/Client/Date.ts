import {TimeSpan} from "./TimeSpan.js";

/**
 * Returns the date at midnight corresponding to the specified date.
 * @param date The source date.
 * @returns The date whose time has been set at midnight.
 */
export function atMidnight(date: Date): Date {
	return new Date(date.getFullYear(), date.getMonth(), date.getDate());
}

/**
 * Gets the number of days in the month of the specified date.
 * @param date The date.
 * @returns The number of days in the month of the specified date.
 */
export function getDaysInMonth(date: Date): number {
	return new Date(date.getFullYear(), date.getMonth() + 1, 0).getDate();
}

/**
 * Gets the quarter corresponding to the specified date.
 * @param date The date.
 * @returns The quarter corresponding to the specified date.
 */
export function getQuarter(date: Date): number {
	return Math.ceil((date.getMonth() + 1) / 3);
}

/**
 * Gets the week number corresponding to the specified date.
 * @param date The date.
 * @returns The week number corresponding to the specified date.
 */
export function getWeekOfYear(date: Date): number {
	const thursday = new Date(date.getFullYear(), date.getMonth(), date.getDate() + 3 - ((date.getDay() + 6) % 7));
	const firstWeek = new Date(thursday.getFullYear(), 0, 4);
	return 1 + Math.round((((thursday.getTime() - firstWeek.getTime()) / TimeSpan.MillisecondsPerDay) - 3 + ((firstWeek.getDay() + 6) % 7)) / 7);
}

/**
 * Gets the current date.
 * @returns The current date.
 */
export function today(): Date {
	const date = new Date;
	date.setHours(0, 0, 0, 0);
	return date;
}
