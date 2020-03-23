<#
.SYNOPSIS
    Format the source code.
.DESCRIPTION
    Formats the .NET source code, as well as all markdown and JSON files.
.EXAMPLE
    The example below will format all source code
    PS C:\> ./format.ps1
.NOTES
    The formatting of markdown and JSON files is done through prettier. This means
    that NPM has to be installed for this functionality to work.
#>

dotnet tool restore
dotnet fantomas --recurse ./src/Exercism.TestRunner.FSharp
dotnet fantomas ./tests/Exercism.TestRunner.FSharp.IntegrationTests/Tests.fs

npx prettier@1.19.1 --write "**/*.{json,md}"