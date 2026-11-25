namespace Belin.UI

open System.Runtime.CompilerServices

/// Defines the position of an element.
type Position =
  | TopStart
  | TopCenter
  | TopEnd
  | MiddleStart
  | MiddleCenter
  | MiddleEnd
  | BottomStart
  | BottomCenter
  | BottomEnd

/// Provides extension members for element positions.
[<AutoOpen>]
module PositionExtensions =
  type Position with

    /// The CSS class of this context.
    member this.CssClass: string =
      match this with
      | TopStart -> "top-0 start-0"
      | TopCenter -> "top-0 start-50 translate-middle-x"
      | TopEnd -> "top-0 end-0"
      | MiddleStart -> "top-50 start-0 translate-middle-y"
      | MiddleCenter -> "top-50 start-50 translate-middle"
      | MiddleEnd -> "top-50 end-0 translate-middle-y"
      | BottomStart -> "bottom-0 start-0"
      | BottomCenter -> "bottom-0 start-50 translate-middle-x"
      | BottomEnd -> "bottom-0 end-0"

/// Provides extension members for element positions.
[<Extension>]
type PositionExtensions =

  /// The CSS class of this context.
  [<Extension>]
  static member CssClass(this: Position) = this.CssClass
