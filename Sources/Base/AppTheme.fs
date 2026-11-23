namespace Belin.UI

open System.Text.Json.Serialization

/// Enumerates different themes an operating system or application can show.
[<JsonConverter(typeof<JsonStringEnumConverter>)>]
type AppTheme =
  | System = 1
  | Light = 2
  | Dark = 3

/// Provides extension members for application themes.
[<AutoOpen>]
module AppThemeExtensions =
  type AppTheme with

    /// The icon corresponding to this context.
    member this.Icon: string =
      match this with
      | AppTheme.Dark -> "dark_mode"
      | AppTheme.Light -> "light_mode"
      | _ -> "contrast"

    /// The icon corresponding to this context.
    member this.Text: string =
      match this with
      | AppTheme.Dark -> "Sombre"
      | AppTheme.Light -> "Clair"
      | _ -> "Auto"
