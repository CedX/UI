namespace Belin.UI

/// Specifies common return values of a dialog box.
[<AutoOpen>]
module DialogResult =

  /// The dialog box does not return any value.
  [<Literal>]
  let None = ""

  /// The return value of the dialog box is "OK".
  [<Literal>]
  let OK = "OK"

  /// The return value of the dialog box is "Cancel".
  [<Literal>]
  let Cancel = "Cancel"

  /// The return value of the dialog box is "Abort".
  [<Literal>]
  let Abort = "Abort"

  /// The return value of the dialog box is "Retry".
  [<Literal>]
  let Retry = "Retry"

  /// The return value of the dialog box is "Ignore".
  [<Literal>]
  let Ignore = "Ignore"
