<#
.SYNOPSIS
	Sets an `HX-Location` header on the HTTP response.
.INPUTS
	The path of the page's location.
#>
function Send-Location {
	[CmdletBinding()]
	[OutputType([void])]
	param (
		# The path of the page's location.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[string] $Path,

		# The selector specifying the content to swap.
		[string] $Select,

		# Value indicating how the response will be swapped in relative to the target.
		[ValidateSet("afterbegin", "afterend", "beforebegin", "beforeend", "delete", "innerHTML", "none", "outerHTML", "textContent")]
		[string] $Swap,

		# The selector specifying the target in which to perform the swap.
		[string] $Target
	)

	process {
		$location = @{ path = $Path }
		if (-not [string]::IsNullOrWhiteSpace($Select)) { $location.select = $Select }
		if (-not [string]::IsNullOrWhiteSpace($Swap)) { $location.swap = $Swap }
		if (-not [string]::IsNullOrWhiteSpace($Target)) { $location.target = $Target }
		Set-PodeHeader "HX-Location" (ConvertTo-Json $location -Compress -EscapeHandling EscapeNonAscii)
	}
}
