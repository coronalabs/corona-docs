# object:seek()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [File][api.type.File]
> __Library__           [io.*][api.library.io]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          seek, files
> __See also__          [io.open()][api.library.io.open]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets and gets the file position, measured from the beginning of the file, to the position given by offset plus a base.

The function can be used to get the current file position (`"cur"`) or `"set"` the file position to the beginning, end, or any position between.

In case of success, the function returns the file position as a [Number][api.type.Number], measured in bytes from the beginning of the file. If this function fails, it returns `nil`, plus a [String][api.type.String] describing the error.

## Syntax

	File:seek( [mode] [, offset] )

##### mode ~^(optional)^~
_[String][api.type.String]._ Can be one of the following values:

* `"set"` &mdash; base is position 0 (beginning of the file)
* `"cur"` &mdash; base is current position (default)
* `"end"` &mdash; base is end of file

The default value for mode is `"cur"`, and for offset is `0`. Therefore, the call `File:seek()` returns the current file position without changing it. The call `File:seek("set")` sets the position to the beginning of the file and returns `0`. The call `File:seek("end")` sets the position to the end of the file, and returns its size.

##### offset ~^(optional)^~
_[Number][api.type.Number]._ Specifies the position for the `"set"` mode. The number is `0` based (which is the beginning of the file).


## Example

``````lua
local fh = io.tmpfile()
fh:write( "My temporary file data" )
fh:flush()  -- Ensure data written to file
 
print( "file position: ", fh:seek() )  -- Show current position
fh:seek( "set", 0 )  -- Reset file position to beginning

local content = fh:read( "*a" )  -- Read all the file
print( "File content: " .. content )
print( "file position: ", fh:seek("end") )  -- Show the end position of file
``````
