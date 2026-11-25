namespace Belin.UI;

using Microsoft.FSharp.Control;

/// <summary>
/// Provides extension members for interoperability with F#.
/// </summary>
public static class FSharpExtensions {
	extension<T>(FSharpAsync<T> fSharpAsync) {

		/// <summary>
		/// Executes a computation in the thread pool.
		/// </summary>
		/// <param name="cancellationToken">The token to cancel the operation.</param>
		/// <returns>A task that will be completed in the corresponding state once the computation terminates.</returns>
		public Task<T> Start(CancellationToken cancellationToken = default) =>
			FSharpAsync.StartImmediateAsTask(fSharpAsync, cancellationToken);
	}
}
