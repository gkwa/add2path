add2path
========

Add current folder to systems path environment variable



Notes
=====

Add folder context menu item to add it to systems path variable, if it not there already.

http://superuser.com/questions/419238/how-do-you-add-an-item-to-the-context-menu-of-a-folder

[HKEY_CLASSES_ROOT\Directory\Shell]
@="none"
[HKEY_CLASSES_ROOT\Directory\shell\gitBashHere]
[HKEY_CLASSES_ROOT\Directory\Background\shell\gitBashHere]
"Icon"="C:\\icons\\git-gui.ico"
"MUIVerb"="git bash here"
"Position"="bottom" 
[HKEY_CLASSES_ROOT\Directory\shell\gitBashHere\command] 
[HKEY_CLASSES_ROOT\Directory\Background\shell\gitBashHere\command]
@="C:\\Program Files\\Console2\\Console.exe -d %v"

Regedit
-------

Create two folders:

	HKEY_CLASSES_ROOT\Directory\shell\AddToSystemPath
	HKEY_CLASSES_ROOT\Directory\Background\shell\AddToSystemPath

With following keys:

	Icon = C:\\icons\\git-gui.ico
	MUIVerb = Add to system Path
	Position = bottom

Create two folders:

	HKEY_CLASSES_ROOT\Directory\shell\AddToSystemPath\command
	HKEY_CLASSES_ROOT\Directory\Background\shell\AddToSystemPath\command

With following keys:

	@="C:\\Program Files\\Console2\\Console.exe -d %v"
	