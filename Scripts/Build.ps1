using module ./Cmdlets.psm1

"Building the solution..."
Build-DotNetSolution ($Release ? "Release" : "Debug")
Invoke-TypeScript Sources/Client/tsconfig.json -SourceMap:(-not $Release)
