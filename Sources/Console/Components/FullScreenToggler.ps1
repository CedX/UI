<#
.SYNOPSIS
	A component for toggling an element to full-screen.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-FullScreenToggler {
	[Alias("FullScreenToggler")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 1, ValueFromPipeline)]
		[object] $Content,

		# The CSS selector used to target the element.
		[ValidateNotNullOrWhiteSpace()]
		[string] $Target = "body",

		# Value indicating whether to prevent the device screen from dimming or locking when in full-screen mode.
		[switch] $WakeLock
	)

	process {
		$attributes = @{ target = $Target; wakeLock = $WakeLock }
		tag fullscreen-toggler -Attributes $attributes -On @{ Click = "this.toggleFullScreen(event)" } $Content
	}
}
