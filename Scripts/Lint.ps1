using module PSScriptAnalyzer
using module ./Cmdlets.psm1

"Performing the static analysis of source code..."
$PSScriptRoot, "Sources", "Tests" | Invoke-ScriptAnalyzer -ExcludeRule PSAvoidUsingCmdletAliases, PSAvoidUsingPositionalParameters, PSUseShouldProcessForStateChangingFunctions -Recurse
Test-ModuleManifest UI.psd1 | Out-Null

Invoke-TypeScript Sources/Client/tsconfig.json -NoEmit
Invoke-ESLint Sources/Client, Tests/Client -Configuration Configuration/ESLint.js
