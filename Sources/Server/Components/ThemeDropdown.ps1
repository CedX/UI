using namespace Belin.UI

<#
.SYNOPSIS
	A dropdown menu for switching the application theme.
.OUTPUTS
	The rendered component.
#>
function New-ThemeDropdown {
	[Alias("ThemeDropdown")]
	[CmdletBinding()]
	[OutputType([string])]
	param (
		# The text of the dropdown menu.
		[Parameter(Position = 1)]
		[ValidateNotNullOrWhiteSpace()]
		[string] $Text = "Thème",

		# The alignment of the dropdown menu.
		[Alignment] $Alignment = [Alignment]::End,

		# The current application theme.
		[AppTheme] $AppTheme = [AppTheme]::System,

		# Value indicating whether to store the application theme in a cookie.
		[switch] $Cookie,

		# The URI for which the associated cookie is valid.
		[string] $CookieDomain,

		# The key of the storage entry providing the saved application theme.
		[ValidateNotNullOrWhiteSpace()]
		[string] $StorageKey = "AppTheme"
	)

	$attributes = @{
		alignment = $Alignment
		appTheme = $AppTheme
		cookie = $Cookie
		cookieDomain = $CookieDomain
		storageKey = $StorageKey
		text = $Text
	}

	New-HtmlCustomElement theme-dropdown -Attributes $attributes {
		li -Class nav-item, dropdown {
			button -Class dropdown-toggle, nav-link -DataSet @{ BsToggle = "dropdown" } -Type button {
				i -Class icon, icon-fill (Format-AppTheme $AppTheme -Icon)
				span -Class ms-2 $Text
			}
			ul -Class dropdown-menu, ($Alignment -eq [Alignment]::End ? "dropdown-menu-end" : "") {
				foreach ($theme in [Enum]::GetValues[AppTheme]()) {
					li {
						button -Class dropdown-item, d-flex, align-items-center, justify-content-between -Type button -Value $theme {
							span {
								i -Class icon, icon-fill, me-2 (Format-AppTheme $theme -Icon)
								Format-AppTheme $theme -Text
							}
							if ($theme -eq $AppTheme) { i -Class icon, ms-3 "check" }
						}
					}
				}
			}
		}
	}
}
