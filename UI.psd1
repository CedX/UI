@{
	DefaultCommandPrefix = "UI"
	ModuleVersion = "0.10.0"
	PowerShellVersion = "7.6"
	RootModule = "Sources/Console/Main.psm1"

	Author = "Cédric Belin <cedx@outlook.com>"
	CompanyName = "Cedric-Belin.fr"
	Copyright = "© Cédric Belin"
	Description = "Component library by Cédric Belin, full stack developer."
	GUID = "13e38ea8-3ddf-4d0d-8440-eeb8d0e8f9fa"

	CmdletsToExport = @()
	RequiredAssemblies = , "Binaries/Belin.UI.dll"
	VariablesToExport = @()

	AliasesToExport = @(
		"ActionBar"
		"Alert"
		"BackButton"
		"DialogBox"
		"FullScreenToggler"
		"KeyboardAccelerator"
		"LoadingIndicator"
		"MenuActivator"
		"OfflineIndicator"
		"TabActivator"
		"ThemeDropdown"
		"Toast"
		"Toaster"
		"TypeAhead"
	)

	FunctionsToExport = @(
		"Format-AppTheme"
		"Format-Context"
		"Format-Position"
		"Format-Size"
		"Format-Variant"
		"New-ActionBar"
		"New-Alert"
		"New-BackButton"
		"New-DialogBox"
		"New-FullScreenToggler"
		"New-KeyboardAccelerator"
		"New-LoadingIndicator"
		"New-MenuActivator"
		"New-OfflineIndicator"
		"New-TabActivator"
		"New-ThemeDropdown"
		"New-Toast"
		"New-Toaster"
		"New-TypeAhead"
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
