
# io.input()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      [Object][api.type.Object]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, input, file
> __See also__          [io.output()][api.library.io.output]
>						[io.read()][api.library.io.read]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the standard input file. When called with a file handle, it simply sets this file handle as the default input file. When called without parameters, it returns the current default input file.

This function returns a file handle of the opened file or the handle to the current input file.


## Syntax

	io.input( file )

##### file ~^(optional)^~
_[Object][api.type.Object]._ File to set as the standard input file. You must use [system.pathForFile()][api.library.system.pathForFile] to create a file name and path to the `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory`, or `system.CachesDirectory` [constants][api.type.Constant].


## Example

`````lua
local path = system.pathForFile( "data.txt", system.DocumentsDirectory )

local tmp = io.input()  -- Save current file handle
io.input( path )        -- Open new file in text mode

print( io.read() )      -- Read and display the file

io.input():close()      -- Close the file
io.input( tmp )         -- Restore the previous file
`````
