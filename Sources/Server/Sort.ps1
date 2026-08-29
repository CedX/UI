using namespace Belin.UI
using namespace System.Collections.Specialized

<#
.SYNOPSIS
	Gets a custom property of the specified sort.
.INPUTS
	The property name.
.OUTPUTS
	The custom property of the specified sort.
#>
function Format-Sort {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The sort.
		[Parameter(Mandatory, Position = 1)]
		[Sort] $InputObject,

		# The property name.
		[Parameter(Mandatory, Position = 2, ValueFromPipeline)]
		[string] $Property,

		# Value indicating whether to return the corresponding icon name.
		[Parameter(ParameterSetName = "Icon")]
		[switch] $Icon
	)

	process {
		if ($Icon) {
			$direction = [SortDirection]::Ascending
			switch ((-not $InputObject.TryGetValue($Property, [ref] $direction)) ? $null : $direction) {
				([SortDirection]::Ascending) { return "arrow_upward" }
				([SortDirection]::Descending) { return "arrow_downward" }
				default { return "swap_vert" }
			}
		}
	}
}

<#
.SYNOPSIS
	Creates a new sort.
.INPUTS
	The names and directions of the sorted properties.
.OUTPUTS
	The newly created sort.
#>
function New-Sort {
	[CmdletBinding(DefaultParameterSetName = "InputObject")]
	[OutputType([Belin.UI.Sort])]
	param (
		# The names and directions of the sorted properties.
		[Parameter(ParameterSetName = "InputObject", Position = 1, ValueFromPipeline)]
		[OrderedDictionary] $InputObject,

		# The names and directions of the sorted properties, as a string to be parsed.
		[Parameter(ParameterSetName = "Property", Position = 1)]
		[string] $Property = ""
	)

	process {
		if ($Property) { return [Sort]::Parse($Property) }

		$sort = [Sort]::new()
		foreach ($key in $InputObject.Keys) { $sort.Add($key, $InputObject[$key]) }
		$sort
	}
}
