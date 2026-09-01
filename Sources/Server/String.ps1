using namespace Belin.UI

<#
.SYNOPSIS
	Formats the specified string.
.INPUTS
	The string to format.
.OUTPUTS
	The formatted string.
#>
function Format-String {
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The string to format.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[AllowEmptyString()]
		[AllowNull()]
		[string] $InputObject,

		# Value indicating whether to convert the first character of the string to uppercase.
		[Parameter(ParameterSetName = "Capitalize")]
		[switch] $Capitalize,

		# An object that supplies culture-specific formatting information.
		[Parameter(ParameterSetName = "Capitalize")]
		[ValidateNotNull()]
		[cultureinfo] $Culture = $PSCulture,

		# The ellipsis to append to the truncated text.
		[Parameter(ParameterSetName = "Truncate")]
		[ValidateNotNullOrWhiteSpace()]
		[string] $Ellipsis = "...",

		# The maximum length of the string to truncate.
		[Parameter(Mandatory, ParameterSetName = "Truncate")]
		[ValidateRange("NonNegative")]
		[int] $Length,

		# Value indicating whether to truncate the string to the given number of characters.
		[Parameter(ParameterSetName = "Truncate")]
		[switch] $Truncate
	)

	process {
		if ($Capitalize) { return [StringExtensions]::Capitalize($InputObject, $Culture) }
		if ($Truncate) { return [StringExtensions]::Truncate($InputObject, $Length, $Ellipsis) }
	}
}
