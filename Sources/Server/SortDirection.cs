namespace Belin.UI;

using System.Text.Json.Serialization;

/// <summary>
/// Specifies the direction of a sorted property.
/// </summary>
[JsonConverter(typeof(JsonStringEnumConverter<SortDirection>))]
public enum SortDirection {

	/// <summary>
	/// The sort is ascending.
	/// </summary>
	Ascending,

	/// <summary>
	/// The sort is descending.
	/// </summary>
	Descending
}
