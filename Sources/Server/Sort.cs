namespace Belin.UI;

using System.Collections;
using System.Collections.Specialized;
using System.Globalization;
using System.Text.Json.Serialization;

/// <summary>
/// Represents information relevant to the sorting of data items.
/// </summary>
/// <param name="properties">The list of properties to be sorted.</param>
public sealed class Sort(IEnumerable<KeyValuePair<string, SortDirection>>? properties = null): OrderedDictionary<string, SortDirection>(properties ?? []) {

	/// <summary>
	/// Creates a new sort from the specified property and direction.
	/// </summary>
	/// <param name="property">The property name.</param>
	/// <param name="direction">The sort direction.</param>
	/// <returns>The sort corresponding to the property and direction.</returns>
	public Sort(string property, SortDirection direction = SortDirection.Ascending): this([new(property, direction)]) {}

	/// <summary>
	/// Creates a new sort from the specified string.
	/// </summary>
	/// <param name="value">A string representing a sort.</param>
	/// <returns>The sort corresponding to the specified string.</returns>
	public static Sort Parse(string value) => new((value.Length > 0 ? value.Split(',') : []).Select(token => {
		var direction = token.StartsWith('-') ? SortDirection.Descending : SortDirection.Ascending;
		return new KeyValuePair<string, SortDirection>(direction == SortDirection.Ascending ? token : token[1..], direction);
	}));

	/// <summary>
	/// Creates a new order hint collection from the specified array of column names.
	/// </summary>
	/// <param name="columns">The array whose elements are copied to the order hint collection.</param>
	/// <returns>The order hint collection corresponding to the specified array of column names.</returns>
	public static implicit operator Sort(object[] columns) =>
		new(columns.Select(value => new KeyValuePair<string, SortDirection>(Convert.ToString(value, CultureInfo.InvariantCulture) ?? "", SortDirection.Ascending)));

	/// <summary>
	/// Creates a new order hint collection from the specified dictionary of column names and sort orders.
	/// </summary>
	/// <param name="orderHints">The dictionary whose elements are copied to the order hint collection.</param>
	/// <returns>The order hint collection corresponding to the specified dictionary of column names and sort orders.</returns>
	public static implicit operator Sort(OrderedDictionary orderHints) => new(orderHints.Cast<DictionaryEntry>().Select(entry => {
		var value = entry.Value is SortDirection sortDirection ? sortDirection : Enum.Parse<SortDirection>(Convert.ToString(entry.Value, CultureInfo.InvariantCulture) ?? "", ignoreCase: true);
		return new KeyValuePair<string, SortDirection>(Convert.ToString(entry.Key, CultureInfo.InvariantCulture) ?? "", value);
	}));

	/// <summary>
	/// Gets the icon corresponding to the specified property.
	/// </summary>
	/// <param name="property">The property name.</param>
	/// <returns>The icon corresponding to the specified property.</returns>
	public string GetIcon(string property) => !TryGetValue(property, out var direction) ? "swap_vert" : direction switch {
		SortDirection.Ascending => "arrow_upward",
		SortDirection.Descending => "arrow_downward"
	};

	/// <summary>
	/// Returns a string representation of this object.
	/// </summary>
	/// <returns>The string representation of this object.</returns>
	public override string ToString() =>
		string.Join(',', this.Select(property => $"{(property.Value == SortDirection.Descending ? "-" : "")}{property.Key}"));
}

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
