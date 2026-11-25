namespace Belin.UI;

using Microsoft.FSharp.Control;
using Microsoft.FSharp.Core;

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
		public Task<T> Start(CancellationToken cancellationToken = default) => FSharpAsync.StartImmediateAsTask(fSharpAsync, cancellationToken);
	}

	extension<T>(FSharpOption<T> fSharpOption) where T: class {
		/// <summary>
		/// Converts this option to a potentially null value.
		/// </summary>
		/// <returns>The result value, which is <see langword="null"/> if the input was <see cref="FSharpOption{T}.None"/>.</returns>
		public T? ToObject() => OptionModule.ToObj(fSharpOption);
	}

	extension<T>(FSharpOption<T> fSharpOption) where T: struct {
		/// <summary>
		/// Converts this option to a nullable value.
		/// </summary>
		/// <returns>The result value, which is <see langword="null"/> if the input was <see cref="FSharpOption{T}.None"/>.</returns>
		public T? ToNullable() => OptionModule.ToNullable(fSharpOption);
	}
}
