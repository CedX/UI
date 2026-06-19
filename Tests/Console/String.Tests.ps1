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
			Format-String $value -Capitalize -Culture fr-FR | Should -BeExactly $expected
		}
	}

	Context "Truncate" {
		It "should truncate the string to the specified length" -ForEach @(
			@{ Value = ""; Length = 0; Expected = "" }
			@{ Value = "foo bar"; Length = 7; Expected = "foo bar" }
			@{ Value = "foo bar"; Length = 0; Expected = "..." }
			@{ Value = "foo bar"; Length = 4; Expected = "foo ..." }
		) {
			Format-String $value -Truncate -Length $length | Should -BeExactly $expected
		}

		It "should append the specified ellipsis to the truncated string" -ForEach @(
			@{ Length = 0; Expected = "--" }
			@{ Length = 4; Expected = "foo --" }
		) {
			Format-String "foo bar" -Truncate -Length $length -Ellipsis "--" | Should -BeExactly $expected
		}
	}
}
