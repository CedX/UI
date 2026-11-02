using module PSScriptAnalyzer
using module ./Tools.psm1

Write-Information "Performing the static analysis of source code..."
dotnet fsharplint lint --lint-config Configuration/FSharpLint.json (Get-Solution)
$PSScriptRoot, "Sources", "Tests" | Invoke-ScriptAnalyzer -ExcludeRule PSAvoidUsingCmdletAliases, PSAvoidUsingPositionalParameters, PSUseShouldProcessForStateChangingFunctions -Recurse
Test-ModuleManifest UI.psd1 | Out-Null

Invoke-TypeScript Sources/Client/tsconfig.json -NoEmit
Invoke-ESLint Sources/Client, Tests/Client -Configuration Configuration/ESLint.js
