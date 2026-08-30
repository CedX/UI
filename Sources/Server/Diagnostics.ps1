<#
.SYNOPSIS
	Compares the current environment name against the specified value.
.OUTPUTS
	`$true` if the specified name is the same as the current environment, otherwise `$false`.
#>
function Test-Environment {
	[CmdletBinding()]
	[OutputType([bool])]
	param (
		# The environment name to validate against.
		[Parameter(Mandatory, Position = 1, ValueFromPipeline)]
		[ValidateSet("Development", "Production", "Staging")]
		[string] $Name
	)

	process {
		$Name -in $Env:PODE_ENVIRONMENT, (Get-PodeConfig).Environment
	}
}

<#
.SYNOPSIS
	Checks whether the application runs as a background service.
.OUTPUTS
	`$true` if the application runs as a background service, otherwise `$false`.
#>
function Test-Service {
	[CmdletBinding()]
	[OutputType([bool])]
	param ()

	(-not [Environment]::UserInteractive) -and (-not (Get-Process -Id $PID).SessionId)
}
