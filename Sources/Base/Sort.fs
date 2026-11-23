namespace Belin.UI

open System.Text.Json.Serialization

/// Specifies the direction of a sorted property.
[<JsonConverter(typeof<JsonStringEnumConverter>)>]
type SortDirection =
  | Ascending = 1
  | Descending = 2
