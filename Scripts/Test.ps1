using module ./Cmdlets.psm1
& "$PSScriptRoot/Build.ps1"

"Running the test suite..."
Invoke-NodeTest
pwsh -Command {
	Import-Module Pester
	Invoke-Pester Tests
	exit $LASTEXITCODE
}
