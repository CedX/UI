using module ./Position.psm1

<#
.SYNOPSIS
	Gets a custom property of the specified position.
.INPUTS
	The position.
.OUTPUTS
	The custom property of the specified position.
#>
function Get-UIPosition {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The position.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Position] $Position,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass
	)

	process {
		if ($CssClass) {
			switch ($Position) {
				([Position]::TopCenter) { return "top-0 start-50 translate-middle-x" }
				([Position]::TopEnd) { return "top-0 end-0" }
				([Position]::MiddleStart) { return "top-50 start-0 translate-middle-y" }
				([Position]::MiddleCenter) { return "top-50 start-50 translate-middle" }
				([Position]::MiddleEnd) { return "top-50 end-0 translate-middle-y" }
				([Position]::BottomStart) { return "bottom-0 start-0" }
				([Position]::BottomCenter) { return "bottom-0 start-50 translate-middle-x" }
				([Position]::BottomEnd) { return "bottom-0 end-0" }
				default { return "top-0 start-0" }
			}
		}
	}
}
