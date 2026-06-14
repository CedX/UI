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
			[Sort]::Of("foo").GetIcon("foo") | Should -BeExactly arrow_upward
			[Sort]::Of("foo", "Descending").GetIcon("foo") | Should -BeExactly arrow_downward
			[Sort]::new().GetIcon("foo") | Should -BeExactly swap_vert
		}
	}

	Context "Parse()" {
		It "should return an empty sort for an empty string" {
			[Sort]::Parse("") | Should -BeNullOrEmpty
		}

		It "should return an ascending direction for a property without prefix, a descending direction for a property with a '-' prefix" {
			$sort = [Sort]::Parse("foo,-bar")
			$sort.Keys | Should -HaveCount 2
			$sort.GetAt(0) | Should -Be ([KeyValuePair[string, SortDirection]]::new("foo", "Ascending"))
			$sort.GetAt(1) | Should -Be ([KeyValuePair[string, SortDirection]]::new("bar", "Descending"))
		}
	}

	Context "ToString()" {
		It "should return an empty string for an empty sort" {
			[Sort]::new().ToString() | Should -BeNullOrEmpty
		}

		It "should return the property for an ascending direction" {
			[Sort]::Of("foo") | Should -BeExactly "foo"
		}

		It "should return the property with a '-' prefix for a descending direction" {
			[Sort]::Parse("foo,-bar") | Should -BeExactly "foo,-bar"
		}
	}
}
