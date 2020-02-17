# object:lines()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [File][api.type.File]
> __Library__           [io.*][api.library.io]
> __Return value__      [Function][api.type.Function] (iterator)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          lines, files
> __See also__          [io.open()][api.library.io.open]<br/>[io.lines()][api.library.io.lines]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an iterator function that, each time it is called, returns a new line from the file.

This function is similar to [io.lines()][api.library.io.lines] except the file must be open first (with [io.open()][api.library.io.open]) and does not automatically close at the end of the file.

## Syntax

	File:lines()


## Example

``````lua
-- Path for the file to read
local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )

if not file then
	-- Error occurred; output the cause
	print( "File error: " .. errorString )
else
	-- Output lines
	for line in file:lines() do
		print( line )
	end
	-- Close the file handle
	io.close( file )
end

file = nil
``````
