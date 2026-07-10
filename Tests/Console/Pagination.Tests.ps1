using namespace Belin.UI
using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `New-Pagination` cmdlet.
#>
Describe "New-Pagination" {
	Context "CurrentPageIndex" {
		It "should always be greater than or equal to zero" {
			Should-Be 0 ([Pagination]@{ CurrentPageIndex = -1 }).CurrentPageIndex
		}
	}

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

	Context "ItemsPerPage" {
		It "should always be between 1 and 1000" {
			Should-Be 1 ([Pagination]@{ ItemsPerPage = -1 }).ItemsPerPage
			Should-Be 1000 ([Pagination]@{ ItemsPerPage = 9999 }).ItemsPerPage
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

	Context "TotalItemCount" {
		It "should always be greater than or equal to zero" {
			Should-Be 0 ([Pagination]@{ TotalItemCount = -1 }).TotalItemCount
			Should-Be 123 (New-UIPagination -TotalItemCount 123).TotalItemCount
		}
	}

	Context "FromQuery" {
		It "should create a new pagination from the specified query" {
			$pagination = New-UIPagination -Query @{ Page = 100; PerPage = 50 }
			Should-Be 99 $pagination.CurrentPageIndex
			Should-Be 50 $pagination.ItemsPerPage
		}

		It "should allow setting a maximum allowed value for the `ItemsPerPage` property" {
			$pagination = New-UIPagination -Query @{ PerPage = 666 } -MaxItemsPerPage 100
			Should-Be 0 $pagination.CurrentPageIndex
			Should-Be 100 $pagination.ItemsPerPage
		}
	}
}

<#
.SYNOPSIS
	Tests the features of the `New-PaginatedList` cmdlet.
#>
Describe "New-PaginatedList" {
	Context "Items" {
		It "should return a paginated list having the specified items" {
			$paginatedList = New-UIPaginatedList -Items 2, 4, 8, 16, 32, 64
			Should-Be 6 $paginatedList.Count
			Should-Be 2 $paginatedList[0]
			Should-Be 64 $paginatedList[5]
		}
	}

	Context "ItemsPerPage" {
		It "should return an empty paginated list with the specified number of items per page" {
			$paginatedList = New-UIPaginatedList 666
			Should-Be 0 $paginatedList.Count
			Should-Be 666 $paginatedList.Pagination.ItemsPerPage
		}
	}
}
