# object:append()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [LineObject][api.type.LineObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          append, line append, add line
> __See also__          [display.newLine()][api.library.display.newLine]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Append one or more segments to an existing object created using [display.newLine()][api.library.display.newLine].


## Syntax

	LineObject:append( x, y [, ... ] )

##### x, y, ... ~^(required)^~
_[Numbers][api.type.Number]._ One or more `[x,y]` pairs specifying a new point to extent the existing line.


## Example

``````lua
local star = display.newLine( 0,-110, 27,-35 )
star:append( 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, 0,-110 )
star:setStrokeColor( 0, 0, 1 )
star.strokeWidth = 5
``````
