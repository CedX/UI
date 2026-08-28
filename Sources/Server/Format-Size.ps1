using namespace Belin.UI

<#
.SYNOPSIS
	Gets a custom property of the specified size.
.INPUTS
	The size.
.OUTPUTS
	The custom property of the specified size.
#>
function Format-Size {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The size.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[Size] $InputObject,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass
	)

	process {
		if ($CssClass) {
			switch ($InputObject) {
				([Size]::ExtraSmall) { return "xs" }
				([Size]::Small) { return "sm" }
				([Size]::Large) { return "lg" }
				([Size]::ExtraLarge) { return "xl" }
				([Size]::ExtraExtraLarge) { return "xxl" }
				default { return "md" }
			}
		}
	}
}
