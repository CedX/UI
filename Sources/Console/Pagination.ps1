using namespace Belin.UI

<#
.SYNOPSIS
	Creates a new pagination.
.OUTPUTS
	The newly created pagination.
#>
function New-Pagination {
	[CmdletBinding()]
	[OutputType([Belin.UI.Pagination])]
	param (
		# The number of items per page.
		[Parameter(Position = 0)]
		[ValidateRange(1, 1000)]
		[int] $ItemsPerPage = 25,

		# The current page index.
		[ValidateRange("NonNegative")]
		[int] $CurrentPageIndex,

		# The total number of items.
		[ValidateRange("NonNegative")]
		[int] $TotalItemCount
	)

	[Pagination]@{
		CurrentPageIndex = $CurrentPageIndex
		ItemsPerPage = $ItemsPerPage
		TotalItemCount = $TotalItemCount
	}
}

<#
.SYNOPSIS
	Creates a new paginated list.
.OUTPUTS
	The newly created paginated list.
#>
function New-PaginatedList {
	[CmdletBinding(DefaultParameterSetName = "Items")]
	[OutputType([Belin.UI.PaginatedList])]
	param (
		# The list items.
		[Parameter(ParameterSetName = "Items")]
		[ValidateNotNull()]
		[object[]] $Items = @(),

		# The information relevant to the pagination of list items.
		[Parameter(ParameterSetName = "Items")]
		[ValidateNotNull()]
		[Pagination] $Pagination = [Pagination]::new(),

		# The number of items per page.
		[Parameter(ParameterSetName = "ItemsPerPage", Position = 0)]
		[ValidateRange(1, 1000)]
		[int] $ItemsPerPage
	)

	if ($ItemsPerPage) { [PaginatedList[object]]::Empty($ItemsPerPage) }
	else {
		$paginatedList = [PaginatedList[object]]::new($Items)
		$paginatedList.Pagination = $Pagination
		$paginatedList
	}
}
