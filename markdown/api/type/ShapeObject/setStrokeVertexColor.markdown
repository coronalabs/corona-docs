# object:setStrokeVertexColor()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ShapeObject][api.type.ShapeObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setStrokeVertexColor, vertex color, stroke, vector
> __See also__          [object:setFillVertexColor()][api.type.ShapeObject.setFillStrokeColor]
>                                [display.newRect()][api.library.display.newRect]
>                                [display.newRoundRect()][api.library.display.newRoundedRect]
>                                [display.newCircle()][api.library.display.newCircle]
>                                [display.newText()][api.library.display.newText]
>                                [display.newPolygon()][api.library.display.newPolygon]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the color of a particular stroke vertex in vector objects.

Until a given stroke vertex color has been assigned, it is interpreted as white. The color of the object at each vertex is a combination of its stroke color and stroke vertex color: the two red values multiplied together produce the final red, and so on for the remaining channels. When the object is drawn, the resulting colors are interpolated between neighboring vertices.

The first time this is called on an object, some extra memory will be allocated to it to store the colors.

## Syntax

    object:setStrokeVertexColor( index, gray )
    object:setStrokeVertexColor( index, gray, alpha )
    object:setStrokeVertexColor( index, red, green, blue )
    object:setStrokeVertexColor( index, red, green, blue, alpha )

##### index ~^(required)^~
_[Numbers][api.type.Number]_ Integer from 1 to [object.strokeVertexCount][api.type.ShapeObject.strokeVertexCount] indicating which stroke vertex to color.

##### gray, red, green, blue, alpha ~^(optional)^~
_[Numbers][api.type.Number]._ Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke color/tint.


## Gotchas

If you are passing a table of color values to this function, the table must be [unpacked][api.library.global.unpack] so that the color values are dictated properly:

``````lualocal rect = display.newRect( 150, 150, 100, 100 )

local colorTable = { 1, 0, 0, 0.5 }
rect:setStrokeVertexColor( 2, unpack(colorTable) )
``````


## Examples

``````lualocal rect = display.newRect( 150, 150, 100, 100 )
rect:setFillColor( 1, 1, 0.8 ) 
rect:setStrokeVertexColor( 1, 1, 0, 0 ) -- index = 1; r, g, b = (1, 0, 0)
rect.strokeWidth = 8
``````
