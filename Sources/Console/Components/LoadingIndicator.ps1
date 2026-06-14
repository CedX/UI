<#
.SYNOPSIS
	A component that shows up when an HTTP request starts, and hides when all concurrent HTTP requests are completed.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-LoadingIndicator {
	[Alias("LoadingIndicator")]
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
		tag loading-indicator -Attributes $attributes -Class $cssClass $Content
	}
}
