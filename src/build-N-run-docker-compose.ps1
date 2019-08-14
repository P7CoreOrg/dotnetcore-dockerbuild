
Write-Host "Script:" $PSCommandPath
Write-Host "Path:" $PSScriptRoot

function Run-Script
{
	param([string]$script)
	$ScriptPath = "$PSScriptRoot\$script.ps1"
	& $ScriptPath
}

Run-Script make-cert
Run-Script build
Run-Script run-docker-compose

