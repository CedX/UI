using namespace Belin.UI

<#
.SYNOPSIS
	Creates a new pagination.
.OUTPUTS
	The newly created pagination.
#>
function New-Pagination {
	[CmdletBinding(DefaultParameterSetName = "ItemsPerPage")]
	[OutputType([Belin.UI.Pagination])]
	param (
		# The number of items per page.
		[Parameter(ParameterSetName = "ItemsPerPage", Position = 1)]
		[ValidateRange(1, 1000)]
		[int] $ItemsPerPage = 25,

		# The current page index.
		[Parameter(ParameterSetName = "ItemsPerPage")]
		[ValidateRange("NonNegative")]
		[int] $CurrentPageIndex,

		# The total number of items.
		[Parameter(ParameterSetName = "ItemsPerPage")]
		[ValidateRange("NonNegative")]
		[int] $TotalItemCount,

		# The hash table providing the query.
		[Parameter(Mandatory, ParameterSetName = "Query")]
		[hashtable] $Query,

		# The maximum number of items allowed per page.
		[Parameter(ParameterSetName = "Query")]
		[ValidateRange(1, 1000)]
		[int] $MaxItemsPerPage = 1000
	)

	if ($PSCmdlet.ParameterSetName -eq "Query") { return [Pagination]::FromQuery($Query, $MaxItemsPerPage) }
	return [Pagination]@{ CurrentPageIndex = $CurrentPageIndex; ItemsPerPage = $ItemsPerPage; TotalItemCount = $TotalItemCount }
}
