using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `Format-AppTheme` cmdlet.
#>
Describe "Format-AppTheme" {
	Context "Icon" {
		It "should return the corresponding icon name" -ForEach @(
			@{ Value = "Dark"; Expected = "dark_mode" }
			@{ Value = "Light"; Expected = "light_mode" }
		) {
			Format-UIAppTheme $value -Icon | Should -BeExactly $expected
		}
	}

	Context "Text" {
		It "should return the corresponding text" -ForEach @(
			@{ Value = "Dark"; Expected = "Sombre" }
			@{ Value = "Light"; Expected = "Clair" }
		) {
			Format-UIAppTheme $value -Text | Should -BeExactly $expected
		}
	}
}
