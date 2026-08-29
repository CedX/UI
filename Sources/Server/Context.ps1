using namespace Belin.UI

<#
.SYNOPSIS
	Gets a custom property of the specified context.
.INPUTS
	The context.
.OUTPUTS
	The custom property of the specified context.
#>
function Format-Context {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The context.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[Context] $InputObject,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass,

		# Value indicating whether to return the corresponding icon name.
		[Parameter(ParameterSetName = "Icon")]
		[switch] $Icon
	)

	process {
		if ($CssClass) {
			return $InputObject.ToString().ToLowerInvariant()
		}

		if ($Icon) {
			switch ($InputObject) {
				([Context]::Danger) { return "error" }
				([Context]::Success) { return "check_circle" }
				([Context]::Warning) { return "warning" }
				default { return "info" }
			}
		}
	}
}
