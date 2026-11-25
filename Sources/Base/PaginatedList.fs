namespace Belin.UI

/// A list with information relevant to the pagination of its items.
type PaginatedList<'T> = {

  /// The list items.
  Items: 'T list

  /// The information relevant to the pagination.
  Pagination: Pagination
}

/// Contains operations for working with paginated lists.
module PaginatedList =

  /// Creates an empty paginated list.
  let empty<'T> (itemsPerPage: int): PaginatedList<'T> =
    { Items = List.empty<'T>; Pagination = Pagination(ItemsPerPage = itemsPerPage) }
