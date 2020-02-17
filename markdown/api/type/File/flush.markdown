# object:flush()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [File][api.type.File]
> __Library__           [io.*][api.library.io]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          flush, files
> __See also__          [io.open()][api.library.io.open]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Commits the file's output buffer. Saves any written data to the file.

## Syntax

	File:flush()


## Example

``````lua
local path = system.pathForFile( "data.txt", system.DocumentsDirectory  )
local file, errorString = io.open( path, "w" )  -- open/create for write
 
if not file then
	-- Error occurred; output the cause
	print( "File error: " .. errorString )
end
 
-- The flush call is not really needed in this example but it would be good if
-- there is a long time between when data is written and when the file is closed

fh:write( "Line 1\n" )
fh:flush()  -- Save the data
 
fh:write( "Line 2\n" )
fh:flush()  -- Save the data
 
fh:write( "Line 3\n" )
 
fh:close()  -- Save all the data and close the file
``````
