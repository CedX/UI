namespace Belin.UI

/// Defines the scenario used in data validation.
module Scenario =

  /// A scenario in which the underlying model is created.
  [<Literal>]
  let Create = "Create"

  /// A scenario in which the underlying model is deleted.
  [<Literal>]
  let Delete = "Delete"

  /// A scenario in which the underlying model is read.
  [<Literal>]
  let Read = "Read"

  /// A scenario in which the underlying model is updated.
  [<Literal>]
  let Update = "Update"
