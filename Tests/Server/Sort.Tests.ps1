using namespace System.Collections.Generic
using module ../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `Format-Sort` cmdlet.
#>
Describe "Format-Sort" {
	Context "Icon" {
		It "should return the icon corresponding to the property's direction" {
			$sort = New-UISort "foo"
			Should-BeString arrow_upward (Format-UISort $sort "foo" -Icon) -CaseSensitive

			$sort = New-UISort "-foo"
			Should-BeString arrow_downward (Format-UISort $sort "foo" -Icon) -CaseSensitive

			$sort = New-UISort
			Should-BeString swap_vert (Format-UISort $sort "foo" -Icon) -CaseSensitive
		}
	}
}

<#
.SYNOPSIS
	Tests the features of the `New-Sort` cmdlet.
#>
Describe "New-Sort" {
	Context "Parse()" {
		It "should return an empty sort for an empty string" {
			Should-Be 0 (New-UISort).Count
		}

		It "should return an ascending direction for a property without prefix, a descending direction for a property with a '-' prefix" {
			$sort = New-UISort "foo,-bar"
			Should-Be 2 $sort.Count
			Should-Be ([KeyValuePair[string, Belin.UI.SortDirection]]::new("foo", "Ascending")) $sort.GetAt(0)
			Should-Be ([KeyValuePair[string, Belin.UI.SortDirection]]::new("bar", "Descending")) $sort.GetAt(1)
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
