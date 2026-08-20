using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `Format-Date` cmdlet.
#>
Describe "Format-Date" {
	Context "Quarter" {
		It "should return the quarter number for the given date" -ForEach @(
			@{ Value = Get-Date -Year 2015 -Month 12 -Day 31; Expected = 4 }
			@{ Value = Get-Date -Year 2017 -Month 7 -Day 14; Expected = 3 }
			@{ Value = Get-Date -Year 2020 -Month 5 -Day 3; Expected = 2 }
			@{ Value = Get-Date -Year 2023 -Month 1 -Day 1; Expected = 1 }
			@{ Value = Get-Date -Year 2024 -Month 2 -Day 29; Expected = 1 }
		) {
			Should-Be $expected (Format-UIDate $value -Quarter)
		}
	}

	Context "WeekOfYear" {
		It "should return the week of year for the given date" -ForEach @(
			@{ Value = Get-Date -Year 2015 -Month 12 -Day 31; Expected = 53 }
			@{ Value = Get-Date -Year 2017 -Month 7 -Day 14; Expected = 28 }
			@{ Value = Get-Date -Year 2020 -Month 5 -Day 3; Expected = 18 }
			@{ Value = Get-Date -Year 2023 -Month 1 -Day 1; Expected = 52 }
			@{ Value = Get-Date -Year 2024 -Month 2 -Day 29; Expected = 9 }
		) {
			Should-Be $expected (Format-UIDate $value -WeekOfYear)
		}
	}
}
