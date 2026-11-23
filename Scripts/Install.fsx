#load "Tools.fsx"
open Tools

writeOutput "Installing the dependencies..."
startProcess "pwsh" "-Command npm install"
