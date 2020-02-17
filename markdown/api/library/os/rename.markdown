
# os.rename()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [os.*][api.library.os]
> __Return value__      [Boolean][api.type.Boolean] and [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rename, file
> __See also__          [system.pathForFile()][api.library.system.pathForFile]
>						[os.remove()][api.library.os.remove]
>						[io.*][api.library.io]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Renames a file or directory and returns two possible values:

* `result` &mdash; `true` if the file was renamed or `nil` if the file was not found.
* `reason` &mdash; `nil` if rename was successful, otherwise a [string][api.type.String] describing the reason for failure.

## Gotchas

You can only rename files in the [DocumentsDirectory][api.library.system.DocumentsDirectory], [ApplicationSupportDirectory][api.library.system.ApplicationSupportDirectory] and [TemporaryDirectory][api.library.system.TemporaryDirectory]. Files in the [ResourceDirectory][api.library.system.ResourceDirectory] are <nobr>read-only.</nobr>

## Syntax

	os.rename( oldname, newname )

##### oldname ~^(required)^~
_[String][api.type.String]._ Old file name.

##### newname ~^(required)^~
_[String][api.type.String]._ New file name.


## Example

`````lua
local destDir = system.DocumentsDirectory  -- Location where the file is stored
local result, reason = os.rename(
	system.pathForFile( "orange.txt", destDir ),
	system.pathForFile( "apple.txt", destDir )
)
 
if result then
	print( "File renamed" )
else
	print( "File not renamed", reason )  --> File not renamed    orange.txt: No such file or directory
end
`````
