# rawequal()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [(globals)][api.library.global]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rawequal, rawget, rawset, tables, values
> __See also__          [rawset()][api.library.global.rawset], [rawget()][api.library.global.rawget]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Performs an equality (`==`) check between two values without invoking a metamethod. Returns a [Boolean][api.type.Boolean].


## Syntax

	rawequal( value1, value2 )

##### value1, value2 ~^(required)^~
_[Numbers][api.type.Number] or [Strings][api.type.String]._ Two values to be compared.


## Example

`````lua
local val1 = 5
local val2 = 5
print( rawequal( val1, val2) ) -- true

`````