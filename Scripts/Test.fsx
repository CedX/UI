#load "Tools.fsx"
open Tools

writeOutput "Running the test suite..."
startProcess "dotnet" "test --settings .runsettings"

startProcess "pwsh" "-Command npx tsc --build Sources/Client/tsconfig.json --sourceMap"
startProcess "pwsh" "-Command npx esbuild --bundle --legal-comments=none --log-level=warning --outfile=Temp/Tests.js --sourcemap Tests/Client/Main.js"
startProcess "pwsh" "-Command node Tests/Client/Playwright.js"
