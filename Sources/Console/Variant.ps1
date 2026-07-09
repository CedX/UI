using namespace Belin.UI

<#
.SYNOPSIS
	Gets a custom property of the specified variant.
.INPUTS
	The variant.
.OUTPUTS
	The custom property of the specified variant.
#>
function Format-Variant {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The variant.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[Variant] $InputObject,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass
	)

	process {
		if ($CssClass) { return [VariantExtensions]::get_CssClass($InputObject) }
	}
}
