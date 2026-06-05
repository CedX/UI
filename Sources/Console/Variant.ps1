using module ./Variant.psm1

<#
.SYNOPSIS
	Gets a custom property of the specified variant.
.INPUTS
	The variant.
.OUTPUTS
	The custom property of the specified variant.
#>
function Get-UIVariant {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The variant.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Variant] $Variant,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass
	)

	process {
		if ($CssClass) {
			return $Variant.ToString().ToLowerInvariant()
		}
	}
}
