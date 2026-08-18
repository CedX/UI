namespace Belin.UI;

using System.Text.Json.Serialization;

/// <summary>
/// Defines the position of an element.
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter<Position>))]
public enum Position {

	/// <summary>
	/// Top left.
	/// </summary>
	TopStart,

	/// <summary>
	/// Top center.
	/// </summary>
	TopCenter,

	/// <summary>
	/// Top right.
	/// </summary>
	TopEnd,

	/// <summary>
	/// Middle left.
	/// </summary>
	MiddleStart,

	/// <summary>
	/// Middle center.
	/// </summary>
	MiddleCenter,

	/// <summary>
	/// Middle right.
	/// </summary>
	MiddleEnd,

	/// <summary>
	/// Bottom left.
	/// </summary>
	BottomStart,

	/// <summary>
	/// Bottom center.
	/// </summary>
	BottomCenter,

	/// <summary>
	/// Bottom right.
	/// </summary>
	BottomEnd
}
