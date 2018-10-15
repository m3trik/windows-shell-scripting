<#description:
	Un-Block files in a directory using powershell.#>




#	recursively unblock all files from a set directory
#get-childitem "full path of folder" -recurse | unblock-file -confirm

get-childitem "C:\Users\m3\AppData\Roaming\Sublime Text 3\Packages\MayaSublime" -recurse | unblock-file -confirm


# un-block only the contents of a single folder:
#get-childitem "full path of folder" | unblock-file -confirm