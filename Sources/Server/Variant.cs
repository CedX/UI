namespace Belin.UI;

using System.Text.Json.Serialization;

/// <summary>
/// Defines tone variants.
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter<Variant>))]
public enum Variant {

	/// <summary>
	/// A danger.
	/// </summary>
	Danger = Context.Danger,

	/// <summary>
	/// A warning.
	/// </summary>
	Warning = Context.Warning,

	/// <summary>
	/// An information.
	/// </summary>
	Info = Context.Info,

	/// <summary>
	/// A success.
	/// </summary>
	Success = Context.Success,

	/// <summary>
	/// A primary tone.
	/// </summary>
	Primary,

	/// <summary>
	/// A secondary tone.
	/// </summary>
	Secondary,

	/// <summary>
	/// A light tone.
	/// </summary>
	Light,

	/// <summary>
	/// A dark tone.
	/// </summary>
	Dark
}
