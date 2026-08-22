using namespace Belin.UI
using namespace System.Collections.Generic
using namespace System.Collections.Specialized

<#
.SYNOPSIS
	Creates a new sort.
.INPUTS
	The property names and sort directions.
.OUTPUTS
	The newly created sort.
#>
function New-Sort {
	[CmdletBinding(DefaultParameterSetName = "InputObject")]
	[OutputType([Belin.UI.Sort])]
	param (
		# The property names and sort directions.
		[Parameter(Mandatory, ParameterSetName = "InputObject", Position = 1, ValueFromPipeline)]
		[OrderedDictionary] $InputObject,

		# The property names and sort directions.
		[Parameter(Mandatory, ParameterSetName = "Property", Position = 1)]
		[AllowEmptyString()]
		[string] $Property
	)

	process {
		if (-not $InputObject) { return [Sort]::Parse($Property) }

		$sort = [Sort]::new()
		foreach ($key in $InputObject.Keys) { $sort.Add($key, $InputObject[$key]) }
		$sort
	}
}
