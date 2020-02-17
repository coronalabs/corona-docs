
# os.remove()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [os.*][api.library.os]
> __Return value__      [String][api.type.String] and [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          remove, delete, file
> __See also__          [system.pathForFile()][api.library.system.pathForFile]
>								[os.rename()][api.library.os.rename]
>								[io.*][api.library.io]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Deletes a file or directory and returns two possible values:

* `result` &mdash; `true` if the file was successfully removed, otherwise `false`.
* `reason` &mdash; `nil` if remove was successful, otherwise a [string][api.type.String] describing the reason for failure.

## Gotchas

You can only remove files in the [DocumentsDirectory][api.library.system.DocumentsDirectory], [ApplicationSupportDirectory][api.library.system.ApplicationSupportDirectory] and [TemporaryDirectory][api.library.system.TemporaryDirectory]. Files in the [ResourceDirectory][api.library.system.ResourceDirectory] are <nobr>read-only.</nobr>

## Syntax

	os.remove( file )

##### file ~^(required)^~
_[String][api.type.String]._ String specifying the name of the file or directory to remove.


## Example

`````lua
local destDir = system.DocumentsDirectory  -- Location where the file is stored
local result, reason = os.remove( system.pathForFile( "apple.txt", destDir ) )
 
if result then
   print( "File removed" )
else
   print( "File does not exist", reason )  --> File does not exist    apple.txt: No such file or directory
end
`````
