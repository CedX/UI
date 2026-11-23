#load "Tools.fsx"
open Tools

writeOutput "Building the solution..."
let sourceMap = if IsRelease then "" else "--sourceMap"
startProcess "dotnet" $"build --configuration {Configuration}"
startProcess "pwsh" $"-Command npx tsc --build Sources/Client/tsconfig.json {sourceMap}"
