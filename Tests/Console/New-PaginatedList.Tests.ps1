using module ../../UI.psd1

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
