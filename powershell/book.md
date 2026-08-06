## Find Desktop

```
[Environment]::GetFolderPath("Desktop")
```

## Enter Desktop

```
cd DESKTOP_VALUE
```

## Find and enter Desktop

```
cd ([Environment]::GetFolderPath("Desktop"))
```

## View current folder

```
dir
```

## Run a script

```
.\FILENAME.ps1
```

## Running script is disabled on that system

```
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```
