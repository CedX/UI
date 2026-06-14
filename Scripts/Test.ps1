using module ./Cmdlets.psm1

"Running the test suite..."
Invoke-DotNetTest -Settings .runsettings
Invoke-TypeScript Sources/Client/tsconfig.json -SourceMap
Invoke-NodeTest

pwsh -Command {
	Import-Module Pester
	Invoke-Pester Tests
	exit $LASTEXITCODE
}
