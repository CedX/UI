namespace Belin.UI

open Belin.Should
open Belin.UI
open Microsoft.VisualStudio.TestTools.UnitTesting
open System

/// Tests the features of the `DateTimeExtensions` module.
[<TestClass>]
type DateTimeExtensionsTests() =

  [<TestMethod>]
  [<DataRow(2015, 12, 31, 4)>]
  [<DataRow(2017, 7, 14, 3)>]
  [<DataRow(2020, 5, 3, 2)>]
  [<DataRow(2023, 1, 1, 1)>]
  [<DataRow(2024, 2, 29, 1)>]
  member _.Quarter(year: int, month: int, day: int, expected: int) =
    DateTime(year, month, day).Quarter |> Should.be expected

  [<TestMethod>]
  [<DataRow(2015, 12, 31, 53)>]
  [<DataRow(2017, 7, 14, 28)>]
  [<DataRow(2020, 5, 3, 18)>]
  [<DataRow(2023, 1, 1, 52)>]
  [<DataRow(2024, 2, 29, 9)>]
  member _.WeekOfYear(year: int, month: int, day: int, expected: int) =
    DateTime(year, month, day).WeekOfYear |> Should.be expected
