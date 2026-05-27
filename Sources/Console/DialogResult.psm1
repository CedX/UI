<#
.SYNOPSIS
	Specifies common return values of a dialog box.
#>
[NoRunspaceAffinity()]
class DialogResult {

	<#
	.SYNOPSIS
		The dialog box does not return any value.
	#>
	static [string] $None = ""

	<#
	.SYNOPSIS
		The return value of the dialog box is "OK".
	#>
	static [string] $OK = "OK"

	<#
	.SYNOPSIS
		The return value of the dialog box is "Cancel".
	#>
	static [string] $Cancel = "Cancel"

	<#
	.SYNOPSIS
		The return value of the dialog box is "Abort".
	#>
	static [string] $Abort = "Abort"

	<#
	.SYNOPSIS
		The return value of the dialog box is "Retry".
	#>
	static [string] $Retry = "Retry"

	<#
	.SYNOPSIS
		The return value of the dialog box is "Ignore".
	#>
	static [string] $Ignore = "Ignore"
}
