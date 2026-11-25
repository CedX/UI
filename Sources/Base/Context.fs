namespace Belin.UI

open System.Runtime.CompilerServices

/// Defines contextual modifiers.
type Context =
  | Danger
  | Warning
  | Info
  | Success

/// Provides extension members for contextual modifiers.
[<AutoOpen>]
module ContextExtensions =
  type Context with

    /// The CSS class of this context.
    member this.CssClass: string =
      (string this).ToLowerInvariant()

    /// The icon corresponding to this context.
    member this.Icon: string =
      match this with
      | Danger -> "error"
      | Warning -> "warning"
      | Info -> "info"
      | Success -> "check_circle"

/// Provides extension members for contextual modifiers.
[<Extension>]
type ContextExtensions =

  /// The CSS class of this context.
  [<Extension>]
  static member CssClass(this: Context) = this.CssClass

  /// The icon corresponding to this context.
  [<Extension>]
  static member Icon(this: Context) = this.Icon
