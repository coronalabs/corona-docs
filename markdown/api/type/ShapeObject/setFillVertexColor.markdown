# object:setFillVertexColor()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ShapeObject][api.type.ShapeObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setFillVertexColor, vertex color, fill, vector
> __See also__          [object:setStrokeVertexColor()][api.type.ShapeObject.setVertexStrokeColor]
>                                [display.newRect()][api.library.display.newRect]
>                                [display.newRoundRect()][api.library.display.newRoundedRect]
>                                [display.newCircle()][api.library.display.newCircle]
>                                [display.newText()][api.library.display.newText]
>                                [display.newPolygon()][api.library.display.newPolygon]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the color of a particular fill vertex in vector and text objects. Also applies a tint to image objects.

Until a given fill vertex color has been assigned, it is interpreted as white. The color/tint of the object at each vertex is a combination of its fill color and fill vertex color: the two red values multiplied together produce the final red, and so on for the remaining channels. When the object is drawn, the resulting colors/tints are interpolated between neighboring vertices.

The first time this is called on an object, some extra memory will be allocated to it to store the colors.

## Syntax

    object:setFillVertexColor( index, gray )
    object:setFillVertexColor( index, gray, alpha )
    object:setFillVertexColor( index, red, green, blue )
    object:setFillVertexColor( index, red, green, blue, alpha )

##### index ~^(required)^~
_[Numbers][api.type.Number]_ Integer from 1 to [object.fillVertexCount][api.type.ShapeObject.fillVertexCount] indicating which fill vertex to color.

In the case of meshes, many methods operate on vertices. In those instances and here, `index` refers to the same vertex. (**TODO** Other shapes. At this point the details are unlikely to change; none of it is written down though.)

##### gray, red, green, blue, alpha ~^(optional)^~
_[Numbers][api.type.Number]._ Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.


## Gotchas

If you are passing a table of color values to this function, the table must be [unpacked][api.library.global.unpack] so that the color values are dictated properly:

``````lua
local myText = display.newText( "hello", 0, 0, native.systemFontBold, 12 )

local colorTable = { 1, 0, 0, 0.5 }
myText:setFillVertexColor( 2, unpack(colorTable) )
``````


## Examples

##### Vector Object Fill

``````lua
local vertices = { 0,-110, 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35 }

local star = display.newPolygon( 300, 300, vertices )
star:setFillVertexColor( 3, 1, 0.2, 0.2 )
``````

##### Text Object Fill

``````lua
local myText = display.newText( "hello", 0, 0, native.systemFontBold, 12 )

myText:setFillVertexColor( 2, 1, 0.2, 0.2 )
``````

##### Image Tint

``````lua
local image = display.newImage( "image.png" )
image:setFillVertexColor( 3, 0.72, 0.9, 0.16, 0.78 )  -- Tints vertex #3 of image green
``````
