/**
 * Provides some common time intervals in milliseconds.
 */
export const TimeSpan = Object.freeze({
	HoursPerDay: 24,
	MinutesPerDay: 24 * 60,
	MinutesPerHour: 60,
	SecondsPerDay: 24 * 60 * 60,
	SecondsPerHour: 60 * 60,
	SecondsPerMinute: 60,
	MillisecondsPerDay: 24 * 60 * 60 * 1_000,
	MillisecondsPerHour: 60 * 60 * 1_000,
	MillisecondsPerMinute: 60 * 1_000,
	MillisecondsPerSecond: 1_000
});
