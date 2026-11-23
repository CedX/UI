namespace Belin.UI

open System.Text.Json.Serialization

/// Identifies the web storage area.
[<JsonConverter(typeof<JsonStringEnumConverter>)>]
type StorageArea =
  | Local = 1
  | Session = 2
