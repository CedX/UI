namespace Belin.UI;

using System.Text.Json.Serialization;

/// <summary>
/// Defines the size of an element.
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter<Size>))]
public enum Size {

	/// <summary>
	/// An extra small size.
	/// </summary>
	ExtraSmall,

	/// <summary>
	/// A small size.
	/// </summary>
	Small,

	/// <summary>
	/// A medium size.
	/// </summary>
	Medium,

	/// <summary>
	/// A large size.
	/// </summary>
	Large,

	/// <summary>
	/// An extra large size.
	/// </summary>
	ExtraLarge,

	/// <summary>
	/// An extra extra large size.
	/// </summary>
	ExtraExtraLarge
}
