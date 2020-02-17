
# display.newLine()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [LineObject][api.type.LineObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          lines, vector
> __See also__          [object:setStrokeColor()][api.type.ShapeObject.setStrokeColor]
>						[object.strokeWidth][api.type.ShapeObject.strokeWidth]
>						[object:append()][api.type.LineObject.append]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Draw a line from one point to another. Optionally, you may append points to the end of the line to create outline shapes or paths.


## Gotchas

Currently, `display.newLine()` objects do not support [touch/tap][guide.events.touchMultitouch] events.


## Syntax

	display.newLine( [parent,] x1, y1, x2, y2 [, x3, y3, ... ] )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the line.

##### x1 / y1 ~^(required)^~
_[Numbers][api.type.Number]._ Coordinates of the beginning of the line.

##### x2 / y2 ~^(required)^~
_[Numbers][api.type.Number]._ Coordinates of the end of the line.

##### x3, y3, ... ~^(optional)^~
_[Numbers][api.type.Number]._ Additional coordinates.


## Example

`````lua
local star = display.newLine( 200, 90, 227, 165 )
star:append( 305,165, 243,216, 265,290, 200,245, 135,290, 157,215, 95,165, 173,165, 200,90 )
star:setStrokeColor( 1, 0, 0, 1 )
star.strokeWidth = 8
`````