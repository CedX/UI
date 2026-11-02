using module ./Tools.psm1

Write-Information "Installing the dependencies..."
Install-PSResource -RequiredResourceFile PSModules.psd1 -TrustRepository -WarningAction Ignore
npm install
