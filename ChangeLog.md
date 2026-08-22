# Changelog

## Version [0.24.0](https://github.com/CedX/UI/compare/v0.23.0...v0.24.0)
- Added the `New-Sort` cmdlet.

## Version [0.23.0](https://github.com/CedX/UI/compare/v0.22.0...v0.23.0)
- Added the `-QueryString` parameter to the `New-Pagination` cmdlet.
- Added an overload to the `Pagination.FromQuery()` method.

## Version [0.22.0](https://github.com/CedX/UI/compare/v0.21.0...v0.22.0)
- Added the `Send-Location` and `Test-Request` cmdlets.
- Renamed the `Set-Trigger` cmdlet to `Send-Trigger`.

## Version [0.21.0](https://github.com/CedX/UI/compare/v0.20.0...v0.21.0)
- Added the `DateTimeExtensions` class.
- Added the `Format-Date` cmdlet.
- Added the `TimeSpan` enumeration.
- Added the `atMidnight()`, `daysInMonth()`, `getQuarter()`, `getWeekOfYear()` and `today()` functions.
- The `hx-confirm-caption` and `hx-confirm-context` attributes, used by the `DialogBox.useConfirmEventHandler()`, are inherited.

## Version [0.20.0](https://github.com/CedX/UI/compare/v0.19.0...v0.20.0)
- Added the `Set-Trigger` cmdlet.

## Version [0.19.0](https://github.com/CedX/UI/compare/v0.18.0...v0.19.0)
- Merged the `Belin.UI.AspNet` assembly into the `Belin.UI` assembly.
- Removed the `TypeAhead` component.

## Version [0.18.0](https://github.com/CedX/UI/compare/v0.17.0...v0.18.0)
- Added the `IDialogEventArgs.button` property.
- Added the `-Button` parameter to the `Show-DialogBox` cmdlet.

## Version [0.17.0](https://github.com/CedX/UI/compare/v0.16.2...v0.17.0)
- Added the `Show-DialogBox` and `Show-Toast` cmdlets.
- Added the `DialogBox.useAlertEventHandler()` method.
- Added the `Toaster.useNotifyEventHandler()` method.
- Renamed the `DialogBox.registerAsHtmxConfirmHandler()` method to `useConfirmEventHandler()`.
- Renamed the `HtmxEventDetail` interface to `HtmxEventArgs`.
- Renamed the `HtmxConfirmEventDetail` interface to `HtmxConfirmEventArgs`.

## Version [0.16.2](https://github.com/CedX/UI/compare/v0.16.1...v0.16.2)
- Allows strings for the `message` parameter of the `alert()` and `confirm()` methods of the `DialogBox` component.
- Allows strings for the `message` parameter of the `Toaster.notify()` method.

## Version [0.16.1](https://github.com/CedX/UI/compare/v0.16.0...v0.16.1)
- The `Toast` component is automatically imported when using the `Toaster` component.

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
- Added the `Query` parameter set to the `New-Pagination` cmdlet.

## Version [0.12.0](https://github.com/CedX/UI/compare/v0.11.0...v0.12.0)
- Added the `PaginatedList` class.
- Added the `New-Pagination` and `New-PaginatedList` cmdlets.
- Replaced the explicit conversions of the `Sort` class by implicit conversions.

## Version [0.11.0](https://github.com/CedX/UI/compare/v0.10.0...v0.11.0)
- Added the `StringExtensions` class.
- Added the `Format-String` cmdlet.
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
- Added the `New-DialogBox`, `New-Toast` and `New-Toaster` cmdlets.
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
