using namespace Belin.UI

<#
.SYNOPSIS
	Gets a custom property of the specified theme.
.INPUTS
	The application theme.
.OUTPUTS
	The custom property of the specified theme.
#>
function Format-AppTheme {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The application theme.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[AppTheme] $InputObject,

		# Value indicating whether to return the corresponding icon name.
		[Parameter(ParameterSetName = "Icon")]
		[switch] $Icon,

		# Value indicating whether to return the corresponding text.
		[Parameter(ParameterSetName = "Text")]
		[switch] $Text
	)

	process {
		if ($Icon) { return [AppThemeExtensions]::get_Icon($InputObject) }
		if ($Text) { return [AppThemeExtensions]::get_Text($InputObject) }
	}
}
