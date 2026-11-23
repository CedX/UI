namespace Belin.UI

open System.Text.Json.Serialization

/// Defines the position of an element.
[<JsonConverter(typeof<JsonStringEnumConverter>)>]
type Position =
  | TopStart = 1
  | TopCenter = 2
  | TopEnd = 3
  | MiddleStart = 4
  | MiddleCenter = 5
  | MiddleEnd = 6
  | BottomStart = 7
  | BottomCenter = 8
  | BottomEnd = 9

/// Provides extension members for element positions.
[<AutoOpen>]
module PositionExtensions =
  type Position with

    /// The CSS class of this context.
    member this.CssClass: string =
      match this with
      | Position.TopCenter -> "top-0 start-50 translate-middle-x"
      | Position.TopEnd -> "top-0 end-0"
      | Position.MiddleStart -> "top-50 start-0 translate-middle-y"
      | Position.MiddleCenter -> "top-50 start-50 translate-middle"
      | Position.MiddleEnd -> "top-50 end-0 translate-middle-y"
      | Position.BottomStart -> "bottom-0 start-0"
      | Position.BottomCenter -> "bottom-0 start-50 translate-middle-x"
      | Position.BottomEnd -> "bottom-0 end-0"
      | _ -> "top-0 start-0"
