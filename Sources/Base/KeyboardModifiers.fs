namespace Belin.UI

open System

/// Enumerates modifier flags for keyboard accelerators.
[<Flags>]
type KeyboardModifiers =
  | None = 0
  | Ctrl = 1
  | Shift = 2
  | Alt = 4
  | Meta = 8
