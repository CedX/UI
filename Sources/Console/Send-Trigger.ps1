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
