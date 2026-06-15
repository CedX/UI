import {Popover, Tab, Tooltip} from "bootstrap";

/**
 * Disposes all popovers attached to the specified element.
 * @param element The source element.
 */
export function disposePopovers(element: Element): void {
	for (const node of element.querySelectorAll('[data-bs-toggle="popover"]')) Popover.getInstance(node)?.dispose();
}

/**
 * Disposes all tabs attached to the specified element.
 * @param element The source element.
 */
export function disposeTabs(element: Element): void {
	for (const node of element.querySelectorAll('[data-bs-toggle="tab"]')) Tab.getInstance(node)?.dispose();
}

/**
 * Disposes all tooltips attached to the specified element.
 * @param element The source element.
 */
export function disposeTooltips(element: Element): void {
	for (const node of element.querySelectorAll('[data-bs-toggle="tooltip"]')) Tooltip.getInstance(node)?.dispose();
}
