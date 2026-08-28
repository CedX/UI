using namespace Belin.UI

<#
.SYNOPSIS
	A component that activates a tab, based on its index saved in the web storage.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-TabActivator {
	[Alias("TabActivator")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 1, ValueFromPipeline)]
		[object] $Content,

		# The storage area to use.
		[StorageArea] $StorageArea = [StorageArea]::Session,

		# The key of the storage entry providing the active tab index.
		[ValidateNotNullOrWhiteSpace()]
		[string] $StorageKey = "ActiveTabIndex"
	)

	process {
		$attributes = @{ storageArea = $StorageArea; storageKey = $StorageKey }
		New-HtmlCustomElement tab-activator -Attributes $attributes $Content
	}
}
