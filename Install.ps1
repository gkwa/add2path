# [Define HKCR provider](http://fortheloveofcode.wordpress.com/2008/06/08/what-no-hkcr-in-powershell/)
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

New-Item -Path HKCR:\Directory\shell -Name AddToSystemPath –Force
New-ItemProperty HKCR:\Directory\shell\AddToSystemPath -Name "MUIVerb" -Value "Add to system Path"
New-ItemProperty HKCR:\Directory\shell\AddToSystemPath -Name "Position" -Value "bottom"

New-Item -Path HKCR:\Directory\shell\AddToSystemPath -Name command –Force
Set-Item -Path HKCR:\Directory\shell\AddToSystemPath\command -Value "cmd.exe /s /k pushd `"%V`""

Copy-Item -Path HKCR:\Directory\shell\AddToSystemPath -Destination HKCR:\Directory\Background\shell -Recurse