#load "Tools.fsx"
open Tools

writeOutput "Performing the static analysis of source code..."
let fsharplint = "fsharplint lint --lint-config Configuration/FSharpLint.json"
startProcess "dotnet" $"{fsharplint} {Solution.Name}"
startProcess "dotnet" $"{fsharplint} Scripts/*.fsx"
startProcess "pwsh" "-Command npx tsc --build Sources/Client/tsconfig.json --noEmit"
startProcess "pwsh" "-Command npx eslint --cache --cache-location Temp --config Configuration/ESLint.js Sources/Client Tests/Client"
