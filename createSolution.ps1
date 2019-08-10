$Time = [System.Diagnostics.Stopwatch]::StartNew()

function PrintElapsedTime {
    Log $([string]::Format("Elapsed time: {0}.{1}", $Time.Elapsed.Seconds, $Time.Elapsed.Milliseconds))
}

function Log {
    Param ([string] $s)
    Write-Output "###### $s"
}

function Check {
    Param ([string] $s)
    if ($LASTEXITCODE -ne 0) { 
        Log "Failed: $s"
        throw "Error case -- see failed step"
    }
}

$FolderToCreate = Join-Path -Path $PSScriptRoot -ChildPath 'src'
If(!(Test-Path -path "$FolderToCreate\"))
{
    #if it does not create it
 
    New-Item -ItemType "directory" -Force -Path $FolderToCreate
}
Set-Location -Path $FolderToCreate

dotnet new sln -n dotnet-dockerbuild
dotnet new webapp -n WebAppOne
dotnet new webapp -n WebAppTwo
dotnet new classlib -n LibOne

 

dotnet add "WebAppOne/WebAppOne.csproj" reference "LibOne/LibOne.csproj"
dotnet add "WebAppTwo/WebAppTwo.csproj" reference "LibOne/LibOne.csproj"

dotnet sln dotnet-dockerbuild.sln add "WebAppOne/WebAppOne.csproj"
dotnet sln dotnet-dockerbuild.sln add "WebAppTwo/WebAppTwo.csproj"
dotnet sln dotnet-dockerbuild.sln add "LibOne/LibOne.csproj"

dotnet restore dotnet-dockerbuild.sln

Set-Location -Path $PSScriptRoot

PrintElapsedTime