using namespace System.Diagnostics.CodeAnalysis

<#
.SYNOPSIS
	Builds the .NET solution and all of its dependencies.
#>
function Build-DotNetSolution {
	param (
		# The configuration to use for generating the project.
		[Parameter(Position = 1)]
		[string] $Configuration
	)

	$argumentList = $Configuration ? "--configuration", $Configuration : @()
	dotnet build @argumentList
}

<#
.SYNOPSIS
	Installs the specified Npm package, if any. Otherwise, installs all packages.
#>
function Install-NpmPackage {
	param (
		# The package to install.
		[Parameter(Position = 1)]
		[string] $Package
	)

	$argumentList = $Package ? @($Package) : @()
	npm install @argumentList
}

<#
.SYNOPSIS
	Invokes the ESLint static analyzer.
#>
function Invoke-ESLint {
	param (
		# The path to the file or directory to be analyzed.
		[Parameter(Mandatory, Position = 1)]
		[string[]] $Path,

		# The path to the configuration file.
		[ValidateScript({ Test-Path $_ -PathType Leaf }, ErrorMessage = "The specified configuration file does not exist.")]
		[string] $Configuration
	)

	$argumentList = "--cache", "--cache-location", "$PSScriptRoot/../Temp"
	if ($Configuration) { $argumentList += "--config", $Configuration }
	$argumentList += $Path
	npx eslint @argumentList
}

<#
.SYNOPSIS
	Invokes the Node.js test runner.
#>
function Invoke-NodeTest {
	npx esbuild --bundle --legal-comments=none --log-level=warning --outfile=Temp/Tests.js --sourcemap Tests/Client/Main.js
	node Tests/Client/Playwright.js
}

<#
.SYNOPSIS
	Invokes the TypeScript compiler.
#>
function Invoke-TypeScript {
	param (
		# The path to the configuration file.
		[Parameter(Mandatory, Position = 1)]
		[ValidateScript({ Test-Path $_ -PathType Leaf }, ErrorMessage = "The specified configuration file does not exist.")]
		[string] $Configuration,

		# Value indicating whether to not emit compiler output files.
		[switch] $NoEmit,

		# Value indicating whether to enable the generation of sourcemap files.
		[switch] $SourceMap,

		# Value indicating whether to monitor file changes.
		[switch] $Watch
	)

	$argumentList = "--build", $Configuration
	if ($NoEmit) { $argumentList += "--noEmit" }
	if ($SourceMap) { $argumentList += "--sourceMap" }
	if ($Watch) { $argumentList += "--preserveWatchOutput", "--watch" }
	npx tsc @argumentList
}

<#
.SYNOPSIS
	Creates a new Git tag.
#>
function New-GitTag {
	[SuppressMessage("PSUseShouldProcessForStateChangingFunctions", "")]
	param (
		# The tag name.
		[Parameter(Mandatory, Position = 1)]
		[string] $Name
	)

	git tag $Name
	git push origin $Name
}

<#
.SYNOPSIS
	Publishes the project package to the NPM registry.
#>
function Publish-NpmPackage {
	npm login
	npm publish
}

<#
.SYNOPSIS
	Publishes the project package to the PowerShell Gallery registry.
#>
function Publish-PSGalleryModule {
	$root = Join-Path $PSScriptRoot .. -Resolve
	$module = Import-PowerShellDataFile $root/UI.psd1

	$output = "$root/Temp/PSModule"
	New-Item $output/Binaries, $output/Sources -ItemType Directory | Out-Null
	Copy-Item $root/UI.psd1 $output/Belin.UI.psd1
	Copy-Item $root/*.md $output
	Copy-Item $root/Sources/Server $output/Sources -Recurse
	Remove-Item $output/Sources/Server/*.cs*, $output/Sources/Server/obj -Recurse
	$module.RequiredAssemblies.ForEach{ "$root/$_" } | Copy-Item -Destination $output/Binaries

	$output = "$root/Temp/PSGallery"
	New-Item $output -ItemType Directory | Out-Null
	Compress-PSResource $root/Temp/PSModule $output
	foreach ($package in Get-Item $output/*.nupkg) { Publish-PSResource -ApiKey $Env:PSGALLERY_API_KEY -NupkgPath $package -Repository PSGallery }
}

<#
.SYNOPSIS
	Checks whether an update is available for the NPM packages.
#>
function Test-NpmPackageUpdate {
	npm outdated
}

<#
.SYNOPSIS
	Checks whether an update is available for the specified PowerShell module.
.INPUTS
	The PowerShell module to be checked.
.OUTPUTS
	An object providing the current and the latest version of the specified module if an update is available, otherwise none.
#>
function Test-PSResourceUpdate {
	[CmdletBinding()]
	[OutputType([psobject])]
	param (
		# The PowerShell module to be checked.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[Microsoft.PowerShell.PSResourceGet.UtilClasses.PSResourceInfo] $InputObject
	)

	process {
		if ($InputObject.Repository -ne "PSGallery") { return }

		$url = "https://www.powershellgallery.com/packages/$($InputObject.Name)"
		$response = Invoke-WebRequest $url -Method Head -MaximumRedirection 0 -SkipHttpErrorCheck -ErrorAction Ignore
		$latestVersion = [semver] (Split-Path $response.Headers.Location -Leaf)

		$module = [pscustomobject]@{ ModuleName = $InputObject.Name; CurrentVersion = $InputObject.Version; LatestVersion = $latestVersion }
		if ($module.LatestVersion -gt $module.CurrentVersion) { $module }
	}
}

<#
.SYNOPSIS
	Updates the specified Npm package, if any. Otherwise, updates all packages.
#>
function Update-NpmPackage {
	param (
		# The package to update.
		[Parameter(Position = 1)]
		[string] $Package
	)

	$argumentList = $Package ? @($Package) : @()
	npm update @argumentList
}
