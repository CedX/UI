@{
	ModuleVersion = "0.5.0"
	PowerShellVersion = "7.6"
	RootModule = "Sources/Console/Main.psm1"

	Author = "Cédric Belin <cedx@outlook.com>"
	CompanyName = "Cedric-Belin.fr"
	Copyright = "© Cédric Belin"
	Description = "Component library by Cédric Belin, full stack developer."
	GUID = "13e38ea8-3ddf-4d0d-8440-eeb8d0e8f9fa"

	CmdletsToExport = @()
	RequiredAssemblies = , "Binaries/Belin.UI.PowerShell.dll"
	VariablesToExport = @()

	AliasesToExport = @(
		"uiActionBar"
		"uiAlert"
		"uiBackButton"
		"uiDialogBox"
		"uiFullScreenToggler"
		"uiKeyboardAccelerator"
		"uiLoadingIndicator"
		"uiMenuActivator"
		"uiOfflineIndicator"
		"uiTabActivator"
		"uiThemeDropdown"
		"uiToast"
		"uiToaster"
		"uiTypeAhead"
	)

	FunctionsToExport = @(
		"Get-UIAppTheme"
		"Get-UIContext"
		"Get-UIPosition"
		"Get-UISize"
		"Get-UIVariant"
		"New-UIActionBar"
		"New-UIAlert"
		"New-UIBackButton"
		"New-UIDialogBox"
		"New-UIFullScreenToggler"
		"New-UIKeyboardAccelerator"
		"New-UILoadingIndicator"
		"New-UIMenuActivator"
		"New-UIOfflineIndicator"
		"New-UITabActivator"
		"New-UIThemeDropdown"
		"New-UIToast"
		"New-UIToaster"
		"New-UITypeAhead"
	)

	RequiredModules = @(
		@{ ModuleName = "Belin.Html"; ModuleVersion = "3.0.1" }
	)

	PrivateData = @{
		PSData = @{
			LicenseUri = "https://github.com/CedX/UI/blob/main/License.md"
			ProjectUri = "https://github.com/CedX/UI"
			ReleaseNotes = "https://github.com/CedX/UI/releases"
			Tags = "belin", "components", "html", "library", "ui"
		}
	}
}
