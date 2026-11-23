namespace Belin.UI

open System.Collections.Generic
open System.Globalization
open System.Text.Json.Serialization
open System
open System.Web

/// Represents information relevant to the pagination of data items.
type Pagination() =
  let mutable currentPageIndex = 0
  let mutable itemsPerPage = 25
  let mutable totalItemCount = 0

  /// The current page index.
  member _.CurrentPageIndex
    with get() = currentPageIndex
    and set(value: int) = currentPageIndex <- max 0 value

  /// The number of items per page.
  member _.ItemsPerPage
    with get() = itemsPerPage
    and set(value: int) = itemsPerPage <- Math.Clamp(value, 1, 1_000)

  /// The total number of items.
  member _.TotalItemCount
    with get() = totalItemCount
    and set(value: int) = totalItemCount <- max 0 value

  /// Value indicating whether a next page exists.
  [<JsonIgnore>]
  member this.HasNextPage: bool = this.CurrentPageIndex < this.LastPageIndex

  /// Value indicating whether a previous page exists.
  [<JsonIgnore>]
  member this.HasPreviousPage: bool = this.CurrentPageIndex > 0

  /// The last page index.
  [<JsonIgnore>]
  member this.LastPageIndex: int = if this.TotalItemCount > 0 then this.TotalItemCount / this.ItemsPerPage else 0

  /// The data limit.
  [<JsonIgnore>]
  member this.Limit: int = this.ItemsPerPage

  /// The data offset.
  [<JsonIgnore>]
  member this.Offset: int = this.CurrentPageIndex * this.ItemsPerPage

  /// Creates a new pagination from the specified query.
  static member FromQuery(query: IDictionary<string, string|null>, ?maxItemsPerPage: int): Pagination =
    let parseInt (key: string) (defaultValue: int): int =
      let numericString =
        match query.TryGetValue key with
        | false, _ -> ""
        | true, value -> value |> defaultIfNull ""
      match Int32.TryParse(numericString, NumberStyles.None, CultureInfo.InvariantCulture) with
      | false, _ -> defaultValue
      | true, number -> number

    Pagination(
      CurrentPageIndex = parseInt "Page" 1 - 1,
      ItemsPerPage = min (parseInt "PerPage" 25) (defaultArg maxItemsPerPage 1_000))

  /// Creates a new pagination from the specified query.
  static member FromQuery(query: string, ?maxItemsPerPage: int): Pagination =
    let queryString = HttpUtility.ParseQueryString query
    let dictionary =
      queryString.AllKeys
      |> Seq.map (fun key -> key |> defaultIfNull "", queryString[key])
      |> dict

    Pagination.FromQuery(dictionary, ?maxItemsPerPage = maxItemsPerPage)
