
# io.output()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      [Object][api.type.Object]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, output, file
> __See also__          [io.input()][api.library.io.input]
>								[io.flush()][api.library.io.flush]
>								[io.write()][api.library.io.write]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the standard output file. When called with a file name, it opens the named file in text mode and sets its handle as the default output file. When called with a file handle, it simply sets this file handle as the default output file. When called without parameters, it returns the current default output file.

The default output is `stdout` which is the Corona Simulator Console. This is similar behavior to [io.input()][api.library.io.input] but operates over the default output file.

This function returns a file handle of the just-opened file or the handle to the current input file handle.

## Syntax

	io.output( [file] )

##### file ~^(optional)^~
_[String][api.type.String] or [Object][api.type.Object]._ File name or file handle.


## Example

`````lua
local tmp = io.output()     -- Save current file handle
local path = system.pathForFile( "newFile.txt", system.DocumentsDirectory  )
io.output( path )           -- Open new file in text mode
 
io.write( "My real data" )  -- Write the file
 
io.output():close()         -- Close the file
io.output( tmp )            -- Restore the previous file
`````
