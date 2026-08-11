Run:

```powershell
winget install --id Git.Git -e --source winget
git --version
IF IT'S NOT A PROBLEM --- close the current PowerShell process and start a new one, so that Git would be loaded
```

Then, for example, temporarily download a script, run it, and delete it (tempdownrundel).

```powershell
$tempRepoPath = "$env:TEMP\apc-$([guid]::NewGuid())"

try {
    git clone --depth 1 https://github.com/bendqh1/apc $tempRepoPath
    Push-Location $tempRepoPath
    & .\main.ps1
}
finally {
    Pop-Location -ErrorAction SilentlyContinue
    Remove-Item $tempRepoPath -Recurse -Force -ErrorAction SilentlyContinue
}
```

`--depth 1` makes it a shallow clone, so Git downloads only the current state rather than the repository's entire history.
