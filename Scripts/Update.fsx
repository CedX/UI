#load "Tools.fsx"
open Tools

writeOutput "Updating the dependencies..."
startProcess "pwsh" "-Command npm update"
