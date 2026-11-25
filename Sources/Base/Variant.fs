namespace Belin.UI

open System.Runtime.CompilerServices

/// Defines tone variants.
type Variant =
  | Danger
  | Warning
  | Info
  | Success
  | Primary
  | Secondary
  | Light
  | Dark

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
