using module ./Tools.psm1

Write-Information "Building the solution..."
dotnet build --configuration ($Release ? "Release" : "Debug")
Invoke-TypeScript Sources/Client/tsconfig.json -SourceMap:(-not $Release)
