
# io.write()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, write, file
> __See also__          [io.open()][api.library.io.open]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Writes the value of each of its arguments to the file. The arguments must be strings or numbers. To write other values, use [tostring()][api.library.global.tostring] or [string.format()][api.library.string.format] before writing.

In the normal mode, this function writes to the standard output (`stdout`) which defaults to the Corona Simulator Console if [io.output()][api.library.io.output] has not been called with a file name. This is equivalent to `io.output():write`. In short, it's similar to `print()`, but no newline character (`\n`) is appended to the output string.

If you intend to write data to a file, `file:write()` should be used instead of `io.write()`.

For security reasons, you are not allowed to write files in the `system.ResourceDirectory` (the directory where the application is stored). You must specify the `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory`, or `system.cachesDirectory` parameter in the [system.pathForFile()][api.library.system.pathForFile] function when opening the file for writing. See [io.open()][api.library.io.open] for details.

## Syntax

	io.write( arg1 [, arg2] [, ...] )

##### arg1, arg2, ... ~^(optional)^~
_[String][api.type.String] or [Number][api.type.Number]._ One or more string or number arguments (separate by commas).


<!--- This no longer works with the Corona Simulator Console

## Example

`````lua
-- This sample shows how to do I/O on the Corona Simulator Console using io.read() and io.write()
 
-- Prompt the user on the terminal
io.write( "Enter you age: " )
 
-- User enters answer on the terminal
local answer = io.read()
 
-- Display the answer on the terminal
io.write( "Your age is ", answer, "\n" )
`````

-->
