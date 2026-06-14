using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `Get-AppTheme` cmdlet.
#>
Describe "Get-AppTheme" {
	Context "Icon" {
		It "should return the corresponding icon name" -ForEach @(
			@{ Value = "Dark"; Expected = "dark_mode" }
			@{ Value = "Light"; Expected = "light_mode" }
		) {
			Get-UIAppTheme $value -Icon | Should -BeExactly $expected
		}
	}

	Context "Text" {
		It "should return the corresponding text" -ForEach @(
			@{ Value = "Dark"; Expected = "Sombre" }
			@{ Value = "Light"; Expected = "Clair" }
		) {
			Get-UIAppTheme $value -Text | Should -BeExactly $expected
		}
	}
}
