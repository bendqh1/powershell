## Install Git on Windows

Installing Git on Windows can be done from PowerShell, is well established and quite safe for running simple scripts.

```powershell
winget install --id Git.Git -e --source winget
git --version
IF IT'S NOT A PROBLEM --- close the current PowerShell process and start a new one, so that Git would be loaded
```

## Run a GitHub script locally 

```
irm https://raw.githubusercontent.com/USER/REPO/refs/heads/main/MAIN.ps1 | iex
```

That will work only for finalized scripts; it won't work if the script has any subfolder.<br>
In case of subfolders, there is a need of a launcher script. A launcher uses Git to **T**emporarily **D**ownload a script, **R**un it, and **D**elete it (TDRD).<br>
I recommend putting the launcher script in the same repository of the project to launch.
