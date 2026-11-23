namespace Belin.UI

open System.Text.Json.Serialization

/// Defines the size of an element.
[<JsonConverter(typeof<JsonStringEnumConverter>)>]
type Size =
  | ExtraSmall = 1
  | Small = 2
  | Medium = 3
  | Large = 4
  | ExtraLarge = 5
  | ExtraExtraLarge = 6

/// Provides extension members for element sizes.
[<AutoOpen>]
module SizeExtensions =
  type Size with

    /// The CSS class of this context.
    member this.CssClass: string =
      match this with
      | Size.ExtraSmall -> "xs"
      | Size.Small -> "sm"
      | Size.Large -> "lg"
      | Size.ExtraLarge -> "xl"
      | Size.ExtraExtraLarge -> "xxl"
      | _ -> "md"
