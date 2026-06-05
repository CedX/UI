using module ./Size.psm1

<#
.SYNOPSIS
	Gets a custom property of the specified size.
.INPUTS
	The size.
.OUTPUTS
	The custom property of the specified size.
#>
function Get-UISize {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The size.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Size] $Size,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass
	)

	process {
		if ($CssClass) {
			switch ($Size) {
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
