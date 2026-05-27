<#
.SYNOPSIS
	Defines the scenario used in data validation.
#>
[NoRunspaceAffinity()]
class Scenario {

	<#
	.SYNOPSIS
		A scenario in which the underlying model is created.
	#>
	static [string] $Creation = "Creation"

	<#
	.SYNOPSIS
		A scenario in which the underlying model is updated.
	#>
	static [string] $Update = "Update"
}
