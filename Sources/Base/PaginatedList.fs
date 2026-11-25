namespace Belin.UI

open System

/// A list with information relevant to the pagination of its items.
type PaginatedList<'T>([<ParamArray>] items: 'T array) =
  inherit ResizeArray<'T>(items)

  /// The information relevant to the pagination of list items.
  member val Pagination = Pagination() with get, set

  /// Creates an empty paginated list.
  static member Empty<'T>(itemsPerPage: int): PaginatedList<'T> =
    PaginatedList<'T>(Pagination = Pagination(ItemsPerPage = itemsPerPage))
