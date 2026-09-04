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

<#
.SYNOPSIS
	Sets an `HX-Trigger` header on the HTTP response.
.INPUTS
	The client-side events to trigger.
#>
function Send-Trigger {
	[CmdletBinding(DefaultParameterSetName = "InputObject")]
	[OutputType([void])]
	param (
		# The client-side events to trigger.
		[Parameter(Mandatory, ParameterSetName = "InputObject", Position = 1, ValueFromPipeline)]
		[hashtable] $InputObject,

		# The names of client-side events to trigger.
		[Parameter(Mandatory, ParameterSetName = "Name", Position = 1)]
		[string[]] $Name,

		# Value indicating whether to trigger client-side events after the settle step.
		[switch] $AfterSettle,

		# Value indicating whether to trigger client-side events after the swap step.
		[switch] $AfterSwap,

		# Value indicating whether to convert all enumerations to their string representation.
		[Parameter(ParameterSetName = "InputObject")]
		[switch] $EnumsAsStrings
	)

	process {
		$header = $AfterSettle ? "HX-Trigger-After-Settle" : ($AfterSwap ? "HX-Trigger-After-Swap" : "HX-Trigger")
		$trigger = $InputObject ? (ConvertTo-Json $InputObject -Compress -Depth 5 -EnumsAsStrings:$EnumsAsStrings -EscapeHandling EscapeNonAscii) : ($Name -join ", ")
		Set-PodeHeader $header $trigger
	}
}

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
