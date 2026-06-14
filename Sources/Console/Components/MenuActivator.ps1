<#
.SYNOPSIS
	A component that activates the items of a menu, based on the current document URL.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-MenuActivator {
	[Alias("MenuActivator")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline)]
		[object] $Content
	)

	process {
		tag menu-activator $Content
	}
}
