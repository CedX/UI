namespace Belin.UI

open System.Runtime.CompilerServices
open System.Text.Json.Serialization

/// Defines contextual modifiers.
[<JsonConverter(typeof<JsonStringEnumConverter>)>]
type Context =
  | Danger = 1
  | Warning = 2
  | Info = 3
  | Success = 4

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
      | Context.Danger -> "error"
      | Context.Success -> "check_circle"
      | Context.Warning -> "warning"
      | _ -> "info"

/// Provides extension members for contextual modifiers.
[<Extension>]
type ContextExtensions =

  /// The CSS class of this context.
  [<Extension>]
  static member CssClass(this: Context) = this.CssClass

  /// The icon corresponding to this context.
  [<Extension>]
  static member Icon(this: Context) = this.Icon
