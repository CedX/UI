namespace Belin.UI

open System.Text.Json.Serialization

/// Defines the alignment of a component.
[<JsonConverter(typeof<JsonStringEnumConverter>)>]
type Alignment =
  | Start = 1
  | Center = 2
  | End = 3
