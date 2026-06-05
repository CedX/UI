using module ./AppTheme.psm1

<#
.SYNOPSIS
	Gets a custom property of the specified theme.
.INPUTS
	The application theme.
.OUTPUTS
	The custom property of the specified theme.
#>
function Get-UIAppTheme {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The application theme.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[AppTheme] $AppTheme,

		# Value indicating whether to return the corresponding icon name.
		[Parameter(ParameterSetName = "Icon")]
		[switch] $Icon,

		# Value indicating whether to return the corresponding text.
		[Parameter(ParameterSetName = "Text")]
		[switch] $Text
	)

	process {
		if ($Icon) {
			switch ($AppTheme) {
				([AppTheme]::Dark) { return "dark_mode" }
				([AppTheme]::Light) { return "light_mode" }
				default { return "contrast" }
			}
		}

		if ($Text) {
			switch ($AppTheme) {
				([AppTheme]::Dark) { return "Sombre" }
				([AppTheme]::Light) { return "Clair" }
				default { return "Auto" }
			}
		}
	}
}
