<# File: install.ps1
	This file installs the text and speec scripts
	

#>
$scriptPath = $MyInvocation.MyCommand.Path
$dir = Split-Path $scriptPath
New-Item $HOME\bin -Type Directory
Set-Location $HOME\bin
Copy-Item -Path $dir\voice\* -Destination .
.\times.ps1