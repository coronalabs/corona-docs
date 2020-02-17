
# io.close()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, close, file
> __See also__          [io.open()][api.library.io.open]
>								[io.read()][api.library.io.read]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Closes an open file handle. Equivalent to `file:close()`. If a file handle is not specified, this function closes the default output file.

## Syntax

	io.close( [file] )

##### file ~^(optional)^~
_[Object][api.type.Object]._ Handle of file (as returned from [io.open][api.library.io.open]) to be closed.


## Example

`````lua
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
	io.close( file )
end

file = nil
`````
