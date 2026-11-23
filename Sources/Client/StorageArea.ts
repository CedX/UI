/**
 * Identifies the web storage area.
 */
export const StorageArea = Object.freeze({
	Local: "Local",
	Session: "Session"
});

/**
 * Identifies the web storage area.
 */
export type StorageArea = typeof StorageArea[keyof typeof StorageArea];
