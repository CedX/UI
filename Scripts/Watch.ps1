using module ./Tools.psm1

"Watching for file changes..."
Invoke-TypeScript Sources/Client/tsconfig.json -SourceMap -Watch
