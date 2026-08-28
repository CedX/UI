namespace Belin.UI;

using System.Text.Json.Serialization;

/// <summary>
/// Defines contextual modifiers.
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter<Context>))]
public enum Context {

	/// <summary>
	/// A danger.
	/// </summary>
	Danger,

	/// <summary>
	/// A warning.
	/// </summary>
	Warning,

	/// <summary>
	/// An information.
	/// </summary>
	Info,

	/// <summary>
	/// A success.
	/// </summary>
	Success
}
