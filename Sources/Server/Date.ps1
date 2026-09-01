using namespace Belin.UI

<#
.SYNOPSIS
	Formats the specified date.
.INPUTS
	The date to format.
.OUTPUTS
	The formatted date.
#>
function Format-Date {
	[CmdletBinding()]
	[OutputType([int])]
	param (
		# The date to format.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[datetime] $InputObject,

		# Value indicating whether to return the quarter corresponding to the specified date.
		[Parameter(ParameterSetName = "Quarter")]
		[switch] $Quarter,

		# Value indicating whether to return the week number corresponding to the specified date.
		[Parameter(ParameterSetName = "WeekOfYear")]
		[switch] $WeekOfYear
	)

	process {
		if ($Quarter) { return [DateTimeExtensions]::get_Quarter($InputObject) }
		if ($WeekOfYear) { return [DateTimeExtensions]::get_WeekOfYear($InputObject) }
	}
}
