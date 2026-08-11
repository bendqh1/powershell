## Run a GitHub script locally (finalized script only)

```
irm https://raw.githubusercontent.com/USER/REPO/refs/heads/main/MAIN.ps1 | iex
```

This won't work if the script has any subfolder.

## Install Git on Windows

Installing Git on Windows can be done from PowerShell, is well established and quite safe for running simple scripts.

```powershell
winget install --id Git.Git -e --source winget
git --version
IF IT'S NOT A PROBLEM --- close the current PowerShell process and start a new one, so that Git would be loaded
```

## Temporarily download a script, run it, and delete it (tempdownrundel) with Git

```powershell
# Remember where you started.
$originalLocation = Get-Location

# Create a unique temporary location for the repository.
$tempRepoPath = "$env:TEMP\apc-$([guid]::NewGuid())"

try {
    # Clone the complete repository, including its subfolders.
    git clone --depth 1 https://github.com/bendqh1/apc $tempRepoPath

    # Show everything that was actually cloned.
    Get-ChildItem $tempRepoPath -Recurse

    # Find the main PowerShell script anywhere in the repository.
    $script = Get-ChildItem $tempRepoPath -Recurse -Filter *.ps1 |
        Select-Object -First 1

    # Use the repository root as the working directory.
    Push-Location $tempRepoPath

    # Run the script while keeping the repository structure available.
    & $script.FullName
}
finally {
    # Return to the folder from which you started.
    Set-Location $originalLocation

    # Delete the temporary repository and all its subfolders.
    # Remove-Item $tempRepoPath -Recurse -Force -ErrorAction SilentlyContinue
}
```

`--depth 1` makes it a shallow clone, so Git downloads only the current state rather than the repository's entire history.
