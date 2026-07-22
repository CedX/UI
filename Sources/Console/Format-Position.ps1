using namespace Belin.UI

<#
.SYNOPSIS
	Gets a custom property of the specified position.
.INPUTS
	The position.
.OUTPUTS
	The custom property of the specified position.
#>
function Format-Position {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The position.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[Position] $InputObject,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass
	)

	process {
		if ($CssClass) { return [PositionExtensions]::get_CssClass($InputObject) }
	}
}
