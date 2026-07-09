<#
.SYNOPSIS
	A component that moves back in the session history when clicked.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-BackButton {
	[Alias("BackButton")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 1, ValueFromPipeline)]
		[object] $Content,

		# The number of pages to go back.
		[ValidateRange("NonNegative")]
		[int] $Steps = 1
	)

	process {
		$attributes = @{ steps = $Steps }
		tag back-button -Attributes $attributes -On @{ Click = "this.goBack(event)" } $Content
	}
}
