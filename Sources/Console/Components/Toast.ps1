using namespace Belin.UI
using namespace System.Diagnostics.CodeAnalysis

<#
.SYNOPSIS
	Renders a toast.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-Toast {
	[Alias("Toast")]
	[CmdletBinding()]
	[OutputType([string])]
	[SuppressMessage("PSReviewUnusedParameter", "Content")]
	param (
		# The child content.
		[Parameter(Position = 1, ValueFromPipeline)]
		[object] $Content,

		# Value indicating whether to automatically hide this toast.
		[switch] $AutoHide,

		# The title displayed in the header.
		[string] $Caption = "",

		# A contextual modifier.
		[Context] $Context = [Context]::Info,

		# The culture used to format the relative time.
		[cultureinfo] $Culture = $PSCulture,

		# The delay, in milliseconds, to hide this toast.
		[ValidateRange("NonNegative")]
		[int] $Delay = 5000,

		# Value indicating whether to apply a transition.
		[switch] $Fade,

		# The icon displayed next to the caption.
		[string] $Icon,

		# Value indicating whether to initially show this component.
		[switch] $Open
	)

	process {
		$attributes = @{
			autoHide = $AutoHide
			caption = $Caption
			context = $Context
			culture = $Culture
			delay = $Delay
			fade = $Fade
			icon = $Icon ? $Icon : $null
			open = $Open
		}

		$contextCssClass = Format-Context $Context -CssClass
		tag toaster-item -Attributes $attributes {
			div -Class toast -DataSet @{ BsAnimation = $Fade ? "true" : "false"; BsAutohide = $AutoHide ? "true" : "false"; BsDelay = $Delay } {
				div -Class toast-header, "toast-header-$contextCssClass" {
					i -Class icon, me-2, "text-$contextCssClass", transform-scale-110 ([string]::IsNullOrWhiteSpace($Icon) ? (Format-Context $Context -Icon) : $Icon)
					b -Class fw-semibold, me-auto $Caption
					small -Class text-secondary # Toast.ElapsedTime
					button -Class btn-close -DataSet @{ BsDismiss = "toast" } -Type button
				}
				div -Class toast-body $Content
			}
		}
	}
}
