using namespace Belin.UI
using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `Pagination` class.
#>
Describe "Pagination" {
	Context "CurrentPageIndex" {
		It "should always be greater than or equal to zero" {
			([Pagination]@{ CurrentPageIndex = -1 }).CurrentPageIndex | Should -Be 0
		}
	}

	Context "HasNextPage" {
		It "should return `$false if there is no next page" {
			[Pagination]::new().HasNextPage | Should -BeFalse
		}

		It "should return `$true if a next page exists" {
			([Pagination]@{ CurrentPageIndex = 2; TotalItemCount = 123 }).HasNextPage | Should -BeTrue
		}
	}

	Context "HasPreviousPage" {
		It "should return `$false if there is no previous page" {
			[Pagination]::new().HasPreviousPage | Should -BeFalse
		}

		It "should return `$true if a previous page exists" {
			([Pagination]@{ CurrentPageIndex = 5 }).HasPreviousPage | Should -BeTrue
		}
	}

	Context "ItemsPerPage" {
		It "should always be between 1 and 1000" {
			([Pagination]@{ ItemsPerPage = -1 }).ItemsPerPage | Should -Be 1
			([Pagination]@{ ItemsPerPage = 9999 }).ItemsPerPage | Should -Be 1000
		}
	}

	Context "LastPageIndex" {
		It "should return the total count divided by the page size rounded up" {
			([Pagination]@{ TotalItemCount = 0 }).LastPageIndex | Should -Be 0
			([Pagination]@{ ItemsPerPage = 1; TotalItemCount = 123 }).LastPageIndex | Should -Be 122
			([Pagination]@{ ItemsPerPage = 10; TotalItemCount = 25 }).LastPageIndex | Should -Be 2
		}
	}

	Context "Offset" {
		It "should return the page size multiplied by the page index" {
			[Pagination]::new().Offset | Should -Be 0
			([Pagination]@{ CurrentPageIndex = 4 }).Offset | Should -Be 100
			([Pagination]@{ CurrentPageIndex = 122; ItemsPerPage = 5 }).Offset | Should -Be 610
		}
	}

	Context "TotalItemCount" {
		It "should always be greater than or equal to zero" {
			([Pagination]@{ TotalItemCount = -1 }).TotalItemCount | Should -Be 0
			([Pagination]@{ TotalItemCount = 123 }).TotalItemCount | Should -Be 123
		}
	}
}
