using namespace Belin.UI

<#
.SYNOPSIS
	Gets a custom property of the specified context.
.INPUTS
	The context.
.OUTPUTS
	The custom property of the specified context.
#>
function Get-Context {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The context.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Context] $InputObject,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass,

		# Value indicating whether to return the corresponding icon name.
		[Parameter(ParameterSetName = "Icon")]
		[switch] $Icon
	)

	process {
		if ($CssClass) { return [ContextExtensions]::get_CssClass($InputObject) }
		if ($Icon) { return [ContextExtensions]::get_Icon($InputObject) }
	}
}
