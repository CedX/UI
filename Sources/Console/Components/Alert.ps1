using namespace Belin.UI

<#
.SYNOPSIS
	Renders an alert.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-Alert {
	[Alias("Alert")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline)]
		[object] $Content,

		# The CSS class names to apply to the underlying element.
		[ValidateNotNull()]
		[string[]] $Class = @(),

		# A contextual modifier.
		[Context] $Context = [Context]::Info,

		# Value indicating whether this alert can be dismissed.
		[switch] $Dismissible,

		# Value indicating whether to apply a transition.
		[switch] $Fade,

		# The icon displayed next to the alert message.
		[string] $Icon = ""
	)

	process {
		div -Class alert, "alert-$(Get-Context $Context -CssClass)", ($Dismissible ? "alert-dismissible" : ""), ($Fade ? "fade show" : ""), ($Class -join " ") {
			div -Class d-flex, align-items-center {
				i -Class icon, flex-shrink-0, me-2 ($Icon ? $Icon : (Get-Context $Context -Icon))
				div $Content
			}

			if ($Dismissible) {
				button -Class btn-close -DataSet @{ BsDismiss = "alert" } -Type button
			}
		}
	}
}
