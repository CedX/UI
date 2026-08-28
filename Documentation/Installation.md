# Installation

## Requirements
Before installing **Belin UI**, you need to make sure you have [Node.js](https://nodejs.org) and [PowerShell](https://learn.microsoft.com/en-us/powershell) up and running.
		
You can verify if you're already good to go with the following commands:

```shell
node --version
# v26.8.1

pwsh --version
# PowerShell 7.6.5
```

## Installing the Node.js module with npm package manager

### 1. Install it
From a command prompt, run:

```powershell
npm install @cedx/ui
```

### 2. Import it
Now in your [JavaScript](https://developer.mozilla.org/docs/Web/JavaScript) code, you can use:

```js
import {...} from "@cedx/ui";
```

## Installing the PowerShell module with PSResourceGet package manager

### 1. Install it
From a command prompt, run:

```powershell
Install-PSResource Belin.UI -Repository PSGallery
```

### 2. Import it
Now in your [PowerShell](https://learn.microsoft.com/en-us/powershell) code, you can use:

```powershell
using module Belin.UI
```
