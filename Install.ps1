# This script will create following directories in your registry:
#
#   HKCR:\Directory\shell\AddToSystemPath
#   HKCR:\Directory\Background\shell\AddToSystemPath
#
# To uninstall tool - just remove them.
# For changes to take effect you must relogin or reboot

$path = Split-Path -Parent $MyInvocation.MyCommand.Definition
$path = Join-Path -Path $path -ChildPath 'Add.ps1'
$cmd = "PowerShell -Command `"& { Start-Process PowerShell -verb runas -ArgumentList '-ExecutionPolicy', 'bypass','-File','" + $path + "','%V' }`""

# [Define HKCR provider](http://fortheloveofcode.wordpress.com/2008/06/08/what-no-hkcr-in-powershell/)
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

New-Item -Path HKCR:\Directory\shell -Name AddToSystemPath –Force
New-ItemProperty HKCR:\Directory\shell\AddToSystemPath -Name "MUIVerb" -Value "Add to system Path"
New-ItemProperty HKCR:\Directory\shell\AddToSystemPath -Name "Position" -Value "bottom"

New-Item -Path HKCR:\Directory\shell\AddToSystemPath -Name command –Force
Set-Item -Path HKCR:\Directory\shell\AddToSystemPath\command -Value $cmd

Copy-Item -Path HKCR:\Directory\shell\AddToSystemPath -Destination HKCR:\Directory\Background\shell -Recurse