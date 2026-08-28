using namespace Belin.UI
using namespace System.Collections.Generic
using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `New-Sort` cmdlet.
#>
Describe "New-Sort" {
	Context "GetIcon()" {
		It "should return the icon corresponding to the sort direction" {
			Should-BeString arrow_upward (New-UISort "foo").GetIcon("foo") -CaseSensitive
			Should-BeString arrow_downward (New-UISort "-foo").GetIcon("foo") -CaseSensitive
			Should-BeString swap_vert (New-UISort).GetIcon("foo") -CaseSensitive
		}
	}

	Context "Parse()" {
		It "should return an empty sort for an empty string" {
			Should-BeCollection (New-UISort) -Count 0
		}

		It "should return an ascending direction for a property without prefix, a descending direction for a property with a '-' prefix" {
			$sort = New-UISort "foo,-bar"
			Should-BeCollection $sort -Count 2
			Should-Be ([KeyValuePair[string, SortDirection]]::new("foo", "Ascending")) $sort.GetAt(0)
			Should-Be ([KeyValuePair[string, SortDirection]]::new("bar", "Descending")) $sort.GetAt(1)
		}
	}

	Context "ToString()" {
		It "should return an empty string for an empty sort" {
			Should-BeEmptyString (New-UISort).ToString()
		}

		It "should return the property for an ascending direction" -ForEach "foo", ([ordered]@{ foo = "Ascending" }) {
			Should-BeString "foo" (New-UISort $_).ToString() -CaseSensitive
		}

		It "should return the property with a '-' prefix for a descending direction" -ForEach "foo,-bar", ([ordered]@{ foo = "Ascending"; bar = "Descending" }) {
			Should-BeString "foo,-bar" (New-UISort $_).ToString() -CaseSensitive
		}
	}
}
