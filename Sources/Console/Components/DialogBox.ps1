<#
.SYNOPSIS
	Renders a dialog box.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-DialogBox {
	[Alias("DialogBox")]
	[CmdletBinding(DefaultParameterSetName = "Content")]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(ParameterSetName = "Content", Position = 0, ValueFromPipeline)]
		[object] $Content,

		# The child content displayed in the body.
		[Parameter(ParameterSetName = "Body")]
		[object] $Body,

		# The title displayed in the header.
		[string] $Caption = "",

		# Value indicating whether to vertically center this dialog box.
		[switch] $Centered,

		# Value indicating whether to apply a transition.
		[switch] $Fade,

		# The child content displayed in the footer.
		[object] $Footer,

		# Value indicating whether to this dialog box will not close when clicking outside of it.
		[switch] $Modal,

		# Value indicating whether to initially show this component.
		[switch] $Open,

		# Value indicating whether the body is scrollable.
		[switch] $Scrollable
	)

	process {
		$attributes = @{
			caption = $Caption
			centered = $Centered
			fade = $Fade
			modal = $Modal
			open = $Open
		}

		tag dialog-box -Attributes $attributes {
			div -Class modal, ($Fade ? "fade" : "") -DataSet @{ BsBackdrop = $Modal ? "static" : "true" } -TabIndex -1 {
				div -Class modal-dialog, ($Centered ? "modal-dialog-centered" : ""), ($Scrollable ? "modal-dialog-scrollable" : "") {
					div -Class modal-content {
						div -Class modal-header {
							h1 -Class modal-title $Caption
							button -Class btn-close -Type button
						}
						div -Class modal-body ($Body ?? $Content)
						div -Class modal-footer -Hidden:$(-not $Footer) $Footer
					}
				}
			}
		}
	}
}
