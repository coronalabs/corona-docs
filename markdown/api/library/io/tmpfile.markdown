
# io.tmpfile()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      [Object][api.type.Object]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, tmp, temporary file, file
> __See also__          [io.read()][api.library.io.read]
>								[io.open()][api.library.io.open]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Opens a temporary file for reading and writing and returns a handle to it. When the app ends normally, this file will be deleted.

Note that calling this function creates an empty file. Use the `file:seek()` function to reset the position in the file for reading back the data. The data will be lost if you close and call `io.tmpfile()` to open it again.

## Gotchas

`io.tmpfile()` seems to always return `nil` on Android, since Android OS discourages the use of this function for both sandboxing and partition space issues.

## Syntax

	io.tmpfile()


## Example

`````lua
local fh = io.tmpfile()  -- Create an empty temporary file
fh:write( "My temporary file data" )
fh:flush()  -- Ensure data written to file
print( "file position: ", fh:seek() )
 
fh:seek( "set", 0 )  -- Reset file position
local content = fh:read( "*a" )  -- Read all the file
print( "File content: " .. content )
`````
