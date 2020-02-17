
# io.flush()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, flush, file
> __See also__          [io.output()][api.library.io.output]
>								[io.write()][api.library.io.write]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Flushes the default output file. Equivalent to `io.output():flush`.

If [io.output][api.library.io.output] has not been changed from its default output (`stdout`), this will flush any [io.write](api.library.io.write) or print data to the Corona Simulator Console, Xcode console, or `Console.app`.

## Syntax

	io.flush()

## Example

`````lua
io.write( "My console data\n" ) -- write the string to console
io.write( "My console data 2\n" ) -- write the string to console
 
io.flush()
`````
