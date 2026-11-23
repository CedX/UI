#load "Tools.fsx"
open Tools

writeOutput "Checking for outdated dependencies..."
startProcess "dotnet" "package list --outdated"
startProcess "pwsh" "-Command npm outdated; exit 0"
