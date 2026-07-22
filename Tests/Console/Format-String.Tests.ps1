using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `Format-String` cmdlet.
#>
Describe "Format-String" {

	Context "Capitalize" {
		It "should convert in uppercase the first character of the specified string" -ForEach @(
			@{ Value = $null; Expected = "" }
			@{ Value = "foo bAr baZ"; Expected = "Foo bAr baZ" }
		) {
			$actual = Format-UIString $value -Capitalize -Culture fr-FR
			if ($expected) { Should-BeString $expected $actual -CaseSensitive }
			else { Should-BeEmptyString $actual }
		}
	}

	Context "Truncate" {
		It "should truncate the string to the specified length" -ForEach @(
			@{ Value = ""; Length = 0; Expected = "" }
			@{ Value = "foo bar"; Length = 7; Expected = "foo bar" }
			@{ Value = "foo bar"; Length = 0; Expected = "..." }
			@{ Value = "foo bar"; Length = 4; Expected = "foo ..." }
		) {
			$actual = Format-UIString $value -Truncate -Length $length
			if ($expected) { Should-BeString $expected $actual -CaseSensitive }
			else { Should-BeEmptyString $actual }
		}

		It "should append the specified ellipsis to the truncated string" -ForEach @(
			@{ Length = 0; Expected = "--" }
			@{ Length = 4; Expected = "foo --" }
		) {
			Should-BeString $expected (Format-UIString "foo bar" -Truncate -Length $length -Ellipsis "--") -CaseSensitive
		}
	}
}
