namespace Belin.UI

open System.Runtime.CompilerServices

/// Defines the size of an element.
type Size =
  | ExtraSmall
  | Small
  | Medium
  | Large
  | ExtraLarge
  | ExtraExtraLarge

/// Provides extension members for element sizes.
[<AutoOpen>]
module SizeExtensions =
  type Size with

    /// The CSS class of this context.
    member this.CssClass: string =
      match this with
      | ExtraSmall -> "xs"
      | Small -> "sm"
      | Medium -> "md"
      | Large -> "lg"
      | ExtraLarge -> "xl"
      | ExtraExtraLarge -> "xxl"

/// Provides extension members for element sizes.
[<Extension>]
type SizeExtensions =

  /// The CSS class of this context.
  [<Extension>]
  static member CssClass(this: Size) = this.CssClass
