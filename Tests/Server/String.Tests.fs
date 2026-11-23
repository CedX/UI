namespace Belin.UI

open Belin.Should
open Belin.UI
open Microsoft.VisualStudio.TestTools.UnitTesting
open System.Globalization

/// Tests the features of the `StringExtensions` module.
[<TestClass>]
type StringExtensionsTests() =

  [<TestMethod>]
  member _.Capitalize() =
    let culture = CultureInfo "fr-FR"

    // It should convert in uppercase the first character of the specified string.
    "".Capitalize culture |> Should.be ""
    "foo bAr baZ".Capitalize culture |> Should.be "Foo bAr baZ"

  [<TestMethod>]
  member _.Truncate() =
    // It should truncate the string to the specified length.
    "".Truncate 0 |> Should.be ""
    "foo bar".Truncate 7 |> Should.be "foo bar"
    "foo bar".Truncate 0 |> Should.be "..."
    "foo bar".Truncate 4 |> Should.be "foo ..."

    // It should append the specified ellipsis to the truncated string.
    "foo bar".Truncate(0, "--") |> Should.be "--"
    "foo bar".Truncate(4, "--") |> Should.be "foo --"
