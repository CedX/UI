#load "Tools.fsx"
open Tools

writeOutput "Watching for file changes..."
startProcess "pwsh" "-Command npx tsc --build Sources/Client/tsconfig.json --preserveWatchOutput --sourceMap --watch"
