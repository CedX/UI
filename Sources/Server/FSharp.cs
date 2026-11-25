namespace Belin.UI;

using Microsoft.FSharp.Control;
using Microsoft.FSharp.Core;
using Microsoft.FSharp.Reflection;
using System.Collections;
using System.Collections.Concurrent;
using System.Reflection;

/// <summary>
/// Provides extension members for interoperability with F#.
/// </summary>
public static class FSharpExtensions {

	/// <summary>
	/// A cache of cases ​​from discriminated unions.
	/// </summary>
	private static readonly ConcurrentDictionary<Type, object[]> unionCases = [];

	extension<T>(FSharpAsync<T> fSharpAsync) {
		/// <summary>
		/// Executes a computation in the thread pool.
		/// </summary>
		/// <param name="cancellationToken">The token to cancel the operation.</param>
		/// <returns>A task that will be completed in the corresponding state once the computation terminates.</returns>
		public Task<T> Start(CancellationToken cancellationToken = default) => FSharpAsync.StartImmediateAsTask(fSharpAsync, cancellationToken);
	}

	extension<T>(FSharpOption<T>? fSharpOption) where T: class {
		/// <summary>
		/// Converts this option to a potentially null value.
		/// </summary>
		/// <returns>The result value, which is <see langword="null"/> if the input was <see cref="FSharpOption{T}.None"/>.</returns>
		public T? ToObject() => fSharpOption is null ? default : OptionModule.ToObj(fSharpOption);
	}

	extension<T>(FSharpOption<T>? fSharpOption) where T: struct {
		/// <summary>
		/// Converts this option to a nullable value.
		/// </summary>
		/// <returns>The result value, which is <see langword="null"/> if the input was <see cref="FSharpOption{T}.None"/>.</returns>
		public T? ToNullable() => fSharpOption is null ? default : OptionModule.ToNullable(fSharpOption);
	}

	extension<T>(T) where T: IComparable, IComparable<T>, IEquatable<T>, IStructuralComparable, IStructuralEquatable {
		/// <summary>
		/// Gets the cases of a discriminated union type.
		/// </summary>
		/// <returns>An array of the cases of the given union type.</returns>
		/// <exception cref="InvalidOperationException">The specified type is not an eligible union type.</exception>
		public static T[] GetUnionCases() {
			var unionType = typeof(T);
			if (unionCases.TryGetValue(unionType, out var cachedCases)) return [.. cachedCases.Cast<T>()];

			if (!FSharpType.IsUnion(unionType, null))
				throw new InvalidOperationException($"The type \"{unionType.Name}\" is not a discriminated union.");

			var cases = FSharpType.GetUnionCases(unionType, null).Select(unionCase => {
				if (unionCase.GetFields().Length > 0)
					throw new InvalidOperationException($"The case \"{unionCase.Name}\" requires arguments and cannot be instantiated.");
				return FSharpValue.MakeUnion(unionCase, [], null);
			}).ToArray();

			unionCases[unionType] = cases;
			return [.. cases.Cast<T>()];
		}
	}
}
