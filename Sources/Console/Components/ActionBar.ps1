<#
.SYNOPSIS
	Renders an action bar.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-ActionBar {
	[Alias("ActionBar")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 1, ValueFromPipeline)]
		[object] $Content
	)

	process {
		New-HtmlCustomElement action-bar $Content
	}
}
