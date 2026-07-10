using module ../../../UI.psd1

<#
.SYNOPSIS
	Tests the features of the `New-Alert` cmdlet.
#>
Describe "New-Alert" {
	It 'should handle the "Class" parameter' {
		Should-BeLikeString "*mb-0 rounded-0*" (uiAlert -Class mb-0, rounded-0) -CaseSensitive
	}

	It 'should handle the "Context" parameter' {
		$alert = uiAlert -Context danger
		Should-BeLikeString "*alert-danger*" $alert -CaseSensitive
		Should-BeLikeString "*<i*>error</i>*" $alert -CaseSensitive
	}

	It 'should handle the "Dismissible" parameter' {
		$alert = uiAlert -Dismissible
		Should-BeLikeString "*alert-dismissible*" $alert -CaseSensitive
		Should-BeLikeString '*data-bs-dismiss="alert"*' $alert -CaseSensitive
	}

	It 'should handle the "Fade" parameter' {
		Should-BeLikeString "*fade show*" (uiAlert -Fade) -CaseSensitive
	}

	It 'should handle the "Icon" parameter' {
		Should-BeLikeString "*<i*>heart</i>*" (uiAlert -Icon heart) -CaseSensitive
	}

	It "should handle the inner content" {
		Should-BeLikeString '*<input type="text">*' (uiAlert { input -Type text }) -CaseSensitive
	}
}
