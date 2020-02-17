# object:close()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [File][api.type.File]
> __Library__           [io.*][api.library.io]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          close, files
> __See also__          [io.open()][api.library.io.open]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Closes the open file (file is returned from [io.open()][api.library.io.open]).

Note that files are automatically closed when their handles are garbage collected, but that takes an unpredictable amount of time to happen.


## Syntax

	File:close()


## Example

``````lua
-- Path for the file
local path = system.pathForFile( "myfile.txt", system.DocumentsDirectory )

-- Open the file handle
local file, errorString = io.open( path, "r" )

if not file then
	-- Error occurred; output the cause
	print( "File error: " .. errorString )
else
	-- Read data from file
	local contents = file:read( "*a" )
	-- Output the file contents
	print( "Contents of " .. path .. "\n" .. contents )
	-- Close the file handle
	file:close()
end

file = nil
``````
