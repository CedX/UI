<#
.SYNOPSIS
	A dynamic list of suggested values for an associated control.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-TypeAhead {
	[Alias("TypeAhead")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The data list identifier.
		[Parameter(Mandatory, Position = 1)]
		[string] $List,

		# The delay in milliseconds to wait before triggering autocomplete suggestions.
		[ValidateRange("NonNegative")]
		[int] $Delay = 300,

		# The minimum character length needed before triggering autocomplete suggestions.
		[ValidateRange("Positive")]
		[int] $MinLength = 2
	)

	process {
		$attributes = @{ delay = $Delay; list = $List; minLength = $MinLength }
		tag type-ahead -Attributes $attributes { datalist -Id $List }
	}
}
