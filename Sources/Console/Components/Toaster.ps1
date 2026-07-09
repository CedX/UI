using namespace Belin.UI
using namespace System.Diagnostics.CodeAnalysis

<#
.SYNOPSIS
	Renders a toaster.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-Toaster {
	[Alias("Toaster")]
	[CmdletBinding()]
	[OutputType([string])]
	[SuppressMessage("PSReviewUnusedParameter", "Content")]
	param (
		# The child content.
		[Parameter(Position = 1, ValueFromPipeline)]
		[object] $Content,

		# Value indicating whether to automatically hide the toasts.
		[switch] $AutoHide,

		# The default contextual modifier.
		[Context] $Context = [Context]::Info,

		# The default culture used to format the relative times.
		[cultureinfo] $Culture = $PSCulture,

		# The default delay, in milliseconds, to hide the toasts.
		[ValidateRange("NonNegative")]
		[int] $Delay = 5000,

		# Value indicating whether to apply a transition.
		[switch] $Fade,

		# The default icon displayed next to the captions.
		[string] $Icon,

		# The toaster placement.
		[Position] $Position = [Position]::BottomEnd
	)

	process {
		$attributes = @{
			autoHide = $AutoHide
			context = $Context
			culture = $Culture
			delay = $Delay
			fade = $Fade
			icon = $Icon ? $Icon : $null
			position = $Position
		}

		tag toaster-container -Attributes $attributes {
			div -Class toast-container, p-3, (Format-Position $Position -CssClass) $Content
			template (New-Toast)
		}
	}
}
