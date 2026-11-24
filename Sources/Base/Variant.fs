namespace Belin.UI

open System.Runtime.CompilerServices
open System.Text.Json.Serialization

/// Defines tone variants.
[<JsonConverter(typeof<JsonStringEnumConverter>)>]
type Variant =
  | Danger = 1
  | Warning = 2
  | Info = 3
  | Success = 4
  | Primary = 5
  | Secondary = 6
  | Light = 7
  | Dark = 8

/// Provides extension members for tone variants.
[<AutoOpen>]
module VariantExtensions =
  type Variant with

    /// The CSS class of this variant.
    member this.CssClass: string =
      (string this).ToLowerInvariant()

/// Provides extension members for tone variants.
[<Extension>]
type VariantExtensions =

  /// The CSS class of this variant.
  [<Extension>]
  static member CssClass(this: Variant) = this.CssClass
