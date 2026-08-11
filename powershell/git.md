Run:

```powershell
winget install --id Git.Git -e --source winget
git --version
IF IT'S NOT A PROBLEM --- close the current PowerShell process and start a new one, so that Git would be loaded
```

Then, for example, temporarily download a script, run it, and delete it (tempdownrundel).

```powershell
# Remember the folder you started in.
$originalLocation = Get-Location

# Create a unique temporary location for the repository.
$tempRepoPath = "$env:TEMP\apc-$([guid]::NewGuid())"

try {
    # Download the repository.
    git clone --depth 1 https://github.com/bendqh1/apc $tempRepoPath

    # Enter the temporary repository.
    Push-Location $tempRepoPath

    # Run the script from the repository.
    & .\main.ps1
}
finally {
    # Return to the folder you were originally in.
    Set-Location $originalLocation

    # Delete the temporary repository.
    Remove-Item $tempRepoPath -Recurse -Force -ErrorAction SilentlyContinue
}
```

`--depth 1` makes it a shallow clone, so Git downloads only the current state rather than the repository's entire history.
