# Changelog

## Version [0.16.0](https://github.com/CedX/UI/compare/v0.15.0...v0.16.0)
- Added the `HtmxConfirmEventDetail.triggeringEvent` property.
- Removed the dependency on [tsyringe](https://github.com/microsoft/tsyringe).
- Replaced the `DialogBox.confirmHandler` property by the `registerAsHtmxConfirmHandler()` method.

## Version [0.15.0](https://github.com/CedX/UI/compare/v0.14.0...v0.15.0)
- Added the `DialogBox.confirmHandler` property.
- Added the `HtmxConfirmEventDetail` type.

## Version [0.14.0](https://github.com/CedX/UI/compare/v0.13.0...v0.14.0)
- Added the `failed()` and `successful()` functions to the `Htmx` module.

## Version [0.13.0](https://github.com/CedX/UI/compare/v0.12.0...v0.13.0)
- Added the `Pagination.FromQuery()` method.
- Added the `Query` parameter set to the `New-UIPagination` cmdlet.

## Version [0.12.0](https://github.com/CedX/UI/compare/v0.11.0...v0.12.0)
- Added the `PaginatedList` class.
- Added the `New-UIPagination` and `New-UIPaginatedList` cmdlets.
- Replaced the explicit conversions of the `Sort` class by implicit conversions.

## Version [0.11.0](https://github.com/CedX/UI/compare/v0.10.0...v0.11.0)
- Added the `StringExtensions` class.
- Added the `Format-UIString` cmdlet.
- Added the `capitalize()` and `truncate()` functions.
- Extracted the [ASP.NET](https://learn.microsoft.com/en-us/aspnet/core) components into a separate assembly.

## Version [0.10.0](https://github.com/CedX/UI/compare/v0.9.0...v0.10.0)
- Added explicit conversions to the `Sort` class.
- Added the `Pagination` class.

## Version [0.9.0](https://github.com/CedX/UI/compare/v0.8.0...v0.9.0)
- Replaced the `Get-` cmdlet prefix by the `Format-` prefix.

## Version [0.8.0](https://github.com/CedX/UI/compare/v0.7.0...v0.8.0)
- Added the `Scenario.Deletion` property.
- Renamed the `IDialogButton.label` property to `text`.

## Version [0.7.0](https://github.com/CedX/UI/compare/v0.6.0...v0.7.0)
- Added the `disposePopovers()` and `disposeTooltips()` functions for [Bootstrap](https://getbootstrap.com) components.

## Version [0.6.0](https://github.com/CedX/UI/compare/v0.5.0...v0.6.0)
- Added the `Scenario` and `Sort` classes.
- Added the `SortDirection` enumeration.
- Fixed the handling of the active menu item in the `MenuActivator` component.

## Version [0.5.0](https://github.com/CedX/UI/compare/v0.4.1...v0.5.0)
- Replaced the [PowerShell](https://learn.microsoft.com/en-us/powershell) enums by [C#](https://learn.microsoft.com/en-us/dotnet/csharp) enums.

## Version [0.4.1](https://github.com/CedX/UI/compare/v0.4.0...v0.4.1)
- Fixed the spacing of the theme dropdown label.
- Updated the font weight of the toaster headers.

## Version [0.4.0](https://github.com/CedX/UI/compare/v0.3.0...v0.4.0)
- Added the `New-UIDialogBox`, `New-UIToast` and `New-UIToaster` cmdlets.
- Added the `uiDialogBox`, `uiToast` and `uiToaster` aliases.

## Version [0.3.0](https://github.com/CedX/UI/compare/v0.2.0...v0.3.0)
- Removed the `ValueFromPipelineByPropertyName` attribute from all cmdlet parameters.

## Version [0.2.0](https://github.com/CedX/UI/compare/v0.1.1...v0.2.0)
- Added aliases to all [PowerShell](https://learn.microsoft.com/en-us/powershell) components.
- Merged the nested [PowerShell](https://learn.microsoft.com/en-us/powershell) modules into a single main module.
- Removed the `DefaultCommandPrefix` from the [PowerShell](https://learn.microsoft.com/en-us/powershell) manifest in favor of a hard-coded command prefix.
- Updated the package dependencies.

## Version [0.1.1](https://github.com/CedX/UI/compare/v0.1.0...v0.1.1)
- Fixed the packaging of the [PowerShell](https://learn.microsoft.com/en-us/powershell) module.

## Version 0.1.0
- Initial release.
