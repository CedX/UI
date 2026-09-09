/**
 * Triggers the download of the specified file.
 * @param file The file to be downloaded.
 */
export function download(file: File): void {
	const url = URL.createObjectURL(file);
	const anchor = document.createElement("a");
	anchor.download = file.name;
	anchor.hidden = true;
	anchor.href = url;

	document.body.appendChild(anchor);
	anchor.click();
	document.body.removeChild(anchor);
	URL.revokeObjectURL(url);
}

/**
 * Fetches the file located at the specified URL.
 * @param url The file URL.
 * @param name The name to assign to the file.
 * @param mediaType The expected media type.
 * @returns The content of the file located at the specified URL.
 */
export async function fetch(url: string|URL, fileName: string, mediaType = "application/octet-stream"): Promise<File> {
	const loadingIndicator = document.querySelector("loading-indicator");

	try {
		loadingIndicator?.show();
		const response = await globalThis.fetch(url, {headers: {Accept: mediaType}});
		if (!response.ok) throw new Error(`${response.status} ${response.statusText}`);
		return new File([await response.blob()], fileName, {type: response.headers.get("Content-Type") ?? mediaType});
	}
	finally {
		loadingIndicator?.hide();
	}
}

/**
 * Opens the specified file.
 * @param file The file to be opened.
 * @param options Value indicating whether to open the file in a new tab.
 */
export function open(file: File, options: {newTab?: boolean} = {}): void {
	const url = URL.createObjectURL(file);
	if (!options.newTab) {
		location.assign(url);
		return;
	}

	const handle = globalThis.open(url, "_blank");
	if (!handle)  {
		location.assign(url);
		return;
	}

	const timer = setInterval(() => {
		if (!handle.closed) return;
		clearInterval(timer);
		URL.revokeObjectURL(url);
	}, 5_000);
}

/**
 * Prints the specified file.
 * @param file The file to be printed.
 */
export function print(file: File): void {
	const url = URL.createObjectURL(file);
	const frame = document.createElement("iframe");
	frame.addEventListener("load", () => frame.contentWindow?.print());
	frame.hidden = true;
	frame.src = url;

	addEventListener("focus", () => {
		document.body.removeChild(frame);
		URL.revokeObjectURL(url);
	}, {once: true});

	document.body.appendChild(frame);
}

/**
 * Converts the specified file to a data URL.
 * @param file The file to convert.
 * @returns The data URL corresponding to the given file.
 */
export function toDataUrl(file: File): Promise<URL> {
	return new Promise((resolve, reject) => {
		const reader = new FileReader;
		reader.addEventListener("error", reject);
		reader.addEventListener("load", () => resolve(new URL(reader.result as string)));
		reader.readAsDataURL(file);
	});
}
