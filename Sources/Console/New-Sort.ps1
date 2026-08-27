using namespace Belin.UI
using namespace System.Collections.Specialized

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

		# The names and directions of the sorted properties.
		[Parameter(ParameterSetName = "Property", Position = 1)]
		[string] $Property = ""
	)

	process {
		if (-not $InputObject) { return [Sort]::Parse($Property) }

		$sort = [Sort]::new()
		foreach ($key in $InputObject.Keys) { $sort.Add($key, $InputObject[$key]) }
		$sort
	}
}
