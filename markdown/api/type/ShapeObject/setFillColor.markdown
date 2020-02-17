# object:setFillColor()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ShapeObject][api.type.ShapeObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setFillColor, color, fill, vector
> __See also__          [object:setStrokeColor()][api.type.ShapeObject.setStrokeColor]
>								[display.newRect()][api.library.display.newRect]
>								[display.newRoundRect()][api.library.display.newRoundedRect]
>								[display.newCircle()][api.library.display.newCircle]
>								[display.newText()][api.library.display.newText]
>								[display.newPolygon()][api.library.display.newPolygon]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the fill color of vector and text objects. Also applies a tint to image objects.


## Syntax

	object:setFillColor( gray )
	object:setFillColor( gray, alpha )
	object:setFillColor( red, green, blue )
	object:setFillColor( red, green, blue, alpha )
	object:setFillColor( gradient )

##### gray, red, green, blue, alpha ~^(optional)^~
_[Numbers][api.type.Number]._ Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the fill color/tint.

##### gradient ~^(optional)^~
_[Table][api.type.Table]_. See the gradient fill example below.


## Gotchas

If you are passing a table of color values to this function, the table must be [unpacked][api.library.global.unpack] so that the color values are dictated properly:

``````lua
local myText = display.newText( "hello", 0, 0, native.systemFontBold, 12 )

local colorTable = { 1, 0, 0, 0.5 }
myText:setFillColor( unpack(colorTable) )
``````


## Examples

##### Vector Object Fill

``````lua
local vertices = { 0,-110, 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35 }

local star = display.newPolygon( 300, 300, vertices )
star:setFillColor( 1, 0.2, 0.2 )
``````

##### Text Object Fill

``````lua
local myText = display.newText( "hello", 0, 0, native.systemFontBold, 12 )

myText:setFillColor( 1, 0.2, 0.2 )
``````

##### Gradient Fill

``````lua
local rect = display.newRect( 0, 0, 100, 200 )

local gradient = {
    type="gradient",
    color1={ 1, 1, 1 }, color2={ 0.8, 0.8, 0.8 }, direction="down"
}
rect:setFillColor( gradient )
``````

##### Image Tint

``````lua
local image = display.newImage( "image.png" )
image:setFillColor( 0.72, 0.9, 0.16, 0.78 )  -- Tints image green
``````
