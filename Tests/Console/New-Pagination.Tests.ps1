using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `New-Pagination` cmdlet.
#>
Describe "New-Pagination" {
	Context "HasNextPage" {
		It "should return `$false if there is no next page" {
			Should-BeFalse (New-UIPagination).HasNextPage
		}

		It "should return `$true if a next page exists" {
			Should-BeTrue (New-UIPagination -CurrentPageIndex 2 -TotalItemCount 123).HasNextPage
		}
	}

	Context "HasPreviousPage" {
		It "should return `$false if there is no previous page" {
			Should-BeFalse (New-UIPagination).HasPreviousPage
		}

		It "should return `$true if a previous page exists" {
			Should-BeTrue (New-UIPagination -CurrentPageIndex 5).HasPreviousPage
		}
	}

	Context "LastPageIndex" {
		It "should return the total count divided by the page size rounded up, minus one" {
			Should-Be 0 (New-UIPagination -TotalItemCount 0).LastPageIndex
			Should-Be 122 (New-UIPagination -ItemsPerPage 1 -TotalItemCount 123).LastPageIndex
			Should-Be 2 (New-UIPagination -ItemsPerPage 10 -TotalItemCount 25).LastPageIndex
		}
	}

	Context "Offset" {
		It "should return the page size multiplied by the page index" {
			Should-Be 0 (New-UIPagination).Offset
			Should-Be 100 (New-UIPagination -CurrentPageIndex 4).Offset
			Should-Be 610 (New-UIPagination -CurrentPageIndex 122 -ItemsPerPage 5).Offset
		}
	}

	Context "FromQuery" {
		It "should create a new pagination from the specified query" -ForEach @{ Page = 100; PerPage = 50 }, "Page=100&PerPage=50" {
			$pagination = New-UIPagination $_
			Should-Be 99 $pagination.CurrentPageIndex
			Should-Be 50 $pagination.ItemsPerPage
		}

		It "should allow setting a maximum allowed value for the `ItemsPerPage` property" -ForEach @{ PerPage = 666 }, "PerPage=666" {
			$pagination = New-UIPagination $_ -MaxItemsPerPage 100
			Should-Be 0 $pagination.CurrentPageIndex
			Should-Be 100 $pagination.ItemsPerPage
		}
	}
}
