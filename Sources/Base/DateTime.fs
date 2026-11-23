namespace Belin.UI

open System
open System.Globalization

/// Provides extension members for dates and times.
[<AutoOpen>]
module DateTimeExtensions =
  type DateTime with

    /// The quarter corresponding to this date.
    member this.Quarter: int = (this.Month - 1) / 3 + 1

    /// The ISO week number corresponding to this date.
    member this.WeekOfYear: int = ISOWeek.GetWeekOfYear this
