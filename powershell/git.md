Run:

```powershell
winget install --id Git.Git -e --source winget
git --version
```

Then, for example, temporarily download a script, run it, and delete it (tempdownrundel).

```powershell
$dir = "$env:TEMP\apc-$([guid]::NewGuid())"

try {
    git clone --depth 1 https://github.com/USER/apc.git $dir
    Push-Location $dir
    & .\main.ps1
}
finally {
    Pop-Location -ErrorAction SilentlyContinue
    Remove-Item $dir -Recurse -Force -ErrorAction SilentlyContinue
}
```

> `--depth 1` makes it a shallow clone, so Git downloads only the current state rather than the repository's entire history.
