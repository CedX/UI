<#
.SYNOPSIS
	Checks whether an `HX-Request` header is present on the HTTP request.
.OUTPUTS
	`$true` if an `HX-Request` header is present on the HTTP request, otherwise `$false`.
#>
function Test-Request {
	[CmdletBinding()]
	[OutputType([bool])]
	param ()

	Test-PodeHeader "HX-Request"
}
