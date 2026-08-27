using namespace Belin.UI
using namespace System.Collections
using namespace System.Globalization
using namespace System.Web

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

		# The dictionary providing the query.
		[Parameter(Mandatory, ParameterSetName = "Query", Position = 1)]
		[IDictionary] $Query,

		# The string providing the query.
		[Parameter(Mandatory, ParameterSetName = "QueryString", Position = 1)]
		[AllowEmptyString()]
		[string] $QueryString,

		# The maximum number of items allowed per page.
		[Parameter(ParameterSetName = "Query")]
		[Parameter(ParameterSetName = "QueryString")]
		[ValidateRange(1, 1000)]
		[int] $MaxItemsPerPage = 1000
	)

	if ($PSCmdlet.ParameterSetName -eq "ItemsPerPage") {
		return [Pagination]@{
			CurrentPageIndex = $CurrentPageIndex
			ItemsPerPage = $ItemsPerPage
			TotalItemCount = $TotalItemCount
		}
	}

	$collection = $Query ? (New-HtmlQueryString $Query -AsCollection) : (New-HtmlQueryString -Value $QueryString -AsCollection)
	$parseInt = { param ([string] $key, [int] $defaultValue)
		$numericString = $collection[$key] ?? $defaultValue.ToString([cultureinfo]::InvariantCulture)
		$value = 0
		[int]::TryParse($numericString, [NumberStyles]::None, [cultureinfo]::InvariantCulture, [ref] $value) ? $value : $defaultValue
	}

	[Pagination]@{
		CurrentPageIndex = (& $parseInt "Page" 1) - 1
		ItemsPerPage = [Math]::Min($MaxItemsPerPage, (& $parseInt "PerPage" 25))
	}
}
