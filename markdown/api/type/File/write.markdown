# object:write()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [File][api.type.File]
> __Library__           [io.*][api.library.io]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          write, files
> __See also__          [io.open()][api.library.io.open]
>                       [Reading and Writing Files][guide.data.readWriteFiles]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Writes the value of each of its arguments to the file. The arguments must be [Strings][api.type.String] or [Numbers][api.type.Number]. To write other values, use `tostring()` or [string.format()][api.library.string.format] before calling `File:write()`.

## Gotchas

For security reasons, you are __not__ allowed to write files in the `system.ResourceDirectory` (the&nbsp;directory where the application is stored). You must specify either `system.DocumentsDirectory`, `system.TemporaryDirectory`, or `system.CachesDirectory` in the [system.pathForFile()][api.library.system.pathForFile] function when opening the file for writing.

## Syntax

	File:write( arg1 [, arg2] [, ...] )

##### arg1, arg2, ... ~^(required)^~
_[String][api.type.String]._ One or more strings to be written to the file represented by the `File` object.

## Example

``````lua
-- Data (string) to write
local saveData = "My app state data"

-- Path for the file to write
local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "w" )

if not file then
	-- Error occurred; output the cause
	print( "File error: " .. errorString )
else
	-- Write data to file
	file:write( saveData )
	-- Close the file handle
	io.close( file )
end

file = nil
``````