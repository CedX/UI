using namespace Belin.UI
using namespace System.Collections.Generic
using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `Sort` class.
#>
Describe "Sort" {
	Context "GetIcon()" {
		It "should return the icon corresponding to the sort direction" {
			Should-BeString arrow_upward ([Sort]::Of("foo").GetIcon("foo")) -CaseSensitive
			Should-BeString arrow_downward ([Sort]::Of("foo", "Descending").GetIcon("foo")) -CaseSensitive
			Should-BeString swap_vert ([Sort]::new().GetIcon("foo")) -CaseSensitive
		}
	}

	Context "Parse()" {
		It "should return an empty sort for an empty string" {
			Should-Be 0 ([Sort]::Parse("").Count)
		}

		It "should return an ascending direction for a property without prefix, a descending direction for a property with a '-' prefix" {
			$sort = [Sort]::Parse("foo,-bar")
			Should-Be 2 $sort.Count
			Should-Be ([KeyValuePair[string, SortDirection]]::new("foo", "Ascending")) $sort.GetAt(0)
			Should-Be ([KeyValuePair[string, SortDirection]]::new("bar", "Descending")) $sort.GetAt(1)
		}
	}

	Context "ToString()" {
		It "should return an empty string for an empty sort" {
			Should-BeEmptyString ([Sort]::new().ToString())
		}

		It "should return the property for an ascending direction" {
			Should-BeString "foo" ([Sort]::Of("foo").ToString()) -CaseSensitive
		}

		It "should return the property with a '-' prefix for a descending direction" {
			Should-BeString "foo,-bar" ([Sort]::Parse("foo,-bar").ToString()) -CaseSensitive
		}
	}
}
