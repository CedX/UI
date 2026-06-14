using namespace Belin.UI

<#
.SYNOPSIS
	Associates a shortcut key with its child content.
.INPUTS
	The child content.
.OUTPUTS
	The rendered component.
#>
function New-UIKeyboardAccelerator {
	[Alias("uiKeyboardAccelerator")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The child content.
		[Parameter(Position = 0, ValueFromPipeline)]
		[object] $Content,

		# Identifies the key for the keyboard accelerator.
		[Parameter(Mandatory)]
		[string] $Key,

		# Identifies the modifiers for the keyboard accelerator.
		[KeyboardModifiers] $Modifiers = [KeyboardModifiers]::None
	)

	process {
		$attributes = @{ key = $Key; modifiers = $Modifiers }
		tag keyboard-accelerator -Attributes $attributes $Content
	}
}
