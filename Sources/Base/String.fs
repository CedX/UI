namespace Belin.UI

open System
open System.Globalization

/// Provides extension members for strings.
[<AutoOpen>]
module StringExtensions =
  type String with

    /// Converts the first character of this string to uppercase.
    member this.Capitalize(?culture: CultureInfo): string =
      if this.Length = 0 then "" else $"{Char.ToUpper(this[0], defaultArg culture CultureInfo.CurrentCulture)}{this[1..]}"

    /// Truncates the specified string to the given number of characters.
    member this.Truncate(length: int, ?ellipsis: string): string =
      if this.Length > length then $"""{this[..length - 1]}{defaultArg ellipsis "..."}""" else this
