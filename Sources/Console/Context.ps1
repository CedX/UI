using module ./Context.psm1

<#
.SYNOPSIS
	Gets a custom property of the specified context.
.INPUTS
	The context.
.OUTPUTS
	The custom property of the specified context.
#>
function Get-UIContext {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The context.
		[Parameter(Mandatory, Position = 0, ValueFromPipeline)]
		[Context] $Context,

		# Value indicating whether to return the corresponding CSS class.
		[Parameter(ParameterSetName = "CssClass")]
		[switch] $CssClass,

		# Value indicating whether to return the corresponding icon name.
		[Parameter(ParameterSetName = "Icon")]
		[switch] $Icon
	)

	process {
		if ($CssClass) {
			return $Context.ToString().ToLowerInvariant()
		}

		if ($Icon) {
			switch ($Context) {
				([Context]::Danger) { return "error" }
				([Context]::Success) { return "check_circle" }
				([Context]::Warning) { return "warning" }
				default { return "info" }
			}
		}
	}
}
