using module ./Cmdlets.psm1

"Building the solution..."
Build-DotNetSolution ($Release ? "Release" : "Debug")

$sourceMap = -not $Release
Invoke-TypeScript Sources/Client/tsconfig.json -SourceMap:$sourceMap
