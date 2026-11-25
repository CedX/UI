namespace Belin.UI

open System.Runtime.CompilerServices

/// Enumerates different themes an operating system or application can show.
type AppTheme =
  | System
  | Light
  | Dark

/// Provides extension members for application themes.
[<AutoOpen>]
module AppThemeExtensions =
  type AppTheme with

    /// The icon corresponding to this context.
    member this.Icon: string =
      match this with
      | System -> "contrast"
      | Light -> "light_mode"
      | Dark -> "dark_mode"

    /// The icon corresponding to this context.
    member this.Text: string =
      match this with
      | System -> "Auto"
      | Light -> "Clair"
      | Dark -> "Sombre"

/// Provides extension members for application themes.
[<Extension>]
type AppThemeExtensions =

  /// The icon corresponding to this context.
  [<Extension>]
  static member Icon(this: AppTheme) = this.Icon

  /// The icon corresponding to this context.
  [<Extension>]
  static member Text(this: AppTheme) = this.Text
