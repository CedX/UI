<#
.SYNOPSIS
	Renders an action bar.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-ActionBar {
	[Alias("ActionBar")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 1, ValueFromPipeline)]
		[object] $Content,

		# Value indicating whether the browser should not render the contents of this element.
		[switch] $Hidden
	)

	process {
		New-HtmlCustomElement action-bar -Hidden:$Hidden $Content
	}
}
