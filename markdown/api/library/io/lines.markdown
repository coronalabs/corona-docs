
# io.lines()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      [Function][api.type.Function] (iterator)
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, lines, file
> __See also__          [io.input()][api.library.io.input]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Opens the given file name in read mode and returns an iterator function that, each time it is called, returns a new line from the file.

The function will open the file and iterate over all lines of the file. When the iterator function detects the end of file, it returns `nil` <nobr>(to finish the loop)</nobr> and automatically closes the file.

The call `io.lines()` with no file is similar to `io.input():lines()`; that is, it iterates over the lines of the default input file, except it does not close the file when the loop ends.

This function returns an iterator function that, each time it is called, returns a new line from the file.


## Syntax

	io.lines( file )

##### file ~^(required)^~
_[Object][api.type.Object]._ File to read. You must use [system.pathForFile()][api.library.system.pathForFile] to create a file name and path to the `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory`, or `system.CachesDirectory` [constants][api.type.Constant].


## Example

`````lua
local path = system.pathForFile( "data.txt", system.DocumentsDirectory )

for line in io.lines( path ) do
	print( line )
end
`````
