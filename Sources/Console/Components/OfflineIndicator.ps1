<#
.SYNOPSIS
	A component that shows up when the network is unavailable, and hides when connectivity is restored.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-OfflineIndicator {
	[Alias("OfflineIndicator")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline)]
		[object] $Content,

		# Value indicating whether to apply a transition.
		[switch] $Fade,

		# Value indicating whether to initially show this component.
		[switch] $Open
	)

	process {
		$attributes = @{ fade = $Fade ; open = $Open }
		$cssClass = ($Fade ? "fade" : ""), ($Open ? "show" : "hide")
		tag offline-indicator -Attributes $attributes -Class $cssClass $Content
	}
}
