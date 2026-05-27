<#
.SYNOPSIS
	Represents information relevant to the pagination of data items.
#>
[NoRunspaceAffinity()]
class Pagination {

	<#
	.SYNOPSIS
		The current page index.
	#>
	[ValidateRange("NonNegative")]
	[int] $CurrentPageIndex

	<#
	.SYNOPSIS
		The number of items per page.
	#>
	[ValidateRange(1, 1000)]
	[int] $ItemsPerPage = 25

	<#
	.SYNOPSIS
		The total number of items.
	#>
	[ValidateRange("NonNegative")]
	[int] $TotalItemCount

	<#
	.SYNOPSIS
		Gets a value indicating whether a next page exists.
	.OUTPUTS
		`$true` if a next page exists, otherwise `$false`.
	#>
	[bool] HasNextPage() {
		return $this.CurrentPageIndex -lt $this.LastPageIndex()
	}

	<#
	.SYNOPSIS
		Gets a value indicating whether a previous page exists.
	.OUTPUTS
		`$true` if a previous page exists, otherwise `$false`.
	#>
	[bool] HasPreviousPage() {
		return $this.CurrentPageIndex -gt 0
	}

	<#
	.SYNOPSIS
		Gets the last page index.
	.OUTPUTS
		The last page index.
	#>
	[int] LastPageIndex() {
		return $this.TotalItemCount -gt 0 ? [Math]::Ceiling($this.TotalItemCount / $this.ItemsPerPage) - 1 : 0
	}

	<#
	.SYNOPSIS
		Gets the data limit.
	.OUTPUTS
		The data limit.
	#>
	[int] Limit() {
		return $this.ItemsPerPage
	}

	<#
	.SYNOPSIS
		Gets the data offset.
	.OUTPUTS
		The data offset.
	#>
	[int] Offset() {
		return $this.CurrentPageIndex * $this.ItemsPerPage
	}
}
