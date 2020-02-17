
# io.type()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [io.*][api.library.io]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          io, type, file
> __See also__          [io.open()][api.library.io.open]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks whether `obj` is a valid file handle. Returns the string `"file"` if `obj` is an open file handle, `"closed file"` if `obj` is a closed file handle, or `nil` if `obj` is not a file handle.

## Syntax

	io.type( obj )

##### obj ~^(required)^~
_[Object][api.type.Object]._ Object to be tested.


## Example

`````lua
local fh
print( io.type( fh ) )  --> nil
 
local path = system.pathForFile( "Icon.png", system.ResourceDirectory )
fh = io.open( path )
print( io.type( fh ) )  --> "file"
 
io.close( fh )
print( io.type( fh ) )  --> "closed file"
`````