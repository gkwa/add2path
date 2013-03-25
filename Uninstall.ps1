# This script will delete following directories in your registry:
#
#   HKCR:\Directory\shell\AddToSystemPath
#   HKCR:\Directory\Background\shell\AddToSystemPath

# [Define HKCR provider](http://fortheloveofcode.wordpress.com/2008/06/08/what-no-hkcr-in-powershell/)
New-PSDrive -Name HKCR -PSProvider Registry -Root HKEY_CLASSES_ROOT

Remove-Item -Path HKCR:\Directory\shell\AddToSystemPath -Recurse
Remove-Item -Path HKCR:\Directory\Background\shell\AddToSystemPath -Recurse