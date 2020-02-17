# object:setStrokeColor()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [ShapeObject][api.type.ShapeObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          setStrokeColor, border color, stroke color
> __See also__          [object:setFillColor()][api.type.ShapeObject.setFillColor]
>								[display.newRect()][api.library.display.newRect]
>								[display.newRoundRect()][api.library.display.newRoundedRect]
>								[display.newCircle()][api.library.display.newCircle]
>								[display.newPolygon()][api.library.display.newPolygon]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the stroke (border) color of vector objects.


## Syntax

	object:setStrokeColor( gray )
	object:setStrokeColor( gray, alpha )
	object:setStrokeColor( red, green, blue )
	object:setStrokeColor( red, green, blue, alpha )

##### gray, red, green, blue, alpha ~^(required)^~
_[Numbers][api.type.Number]._ Numbers between `0` and `1` that represent the corresponding value for that channel. `alpha` represents the opacity of the stroke.


## Gotchas

If you are passing a table of color values to this function, the table must be [unpacked][api.library.global.unpack] so that the color values are dictated properly:

``````lua
local rect = display.newRect( 150, 150, 100, 100 )

local colorTable = { 1, 0, 0, 0.5 }
rect:setStrokeColor( unpack(colorTable) )
``````


## Example

``````lua
local rect = display.newRect( 150, 150, 100, 100 )
rect:setFillColor( 1, 1, 0.8 ) 
rect:setStrokeColor( 1, 0, 0 )
rect.strokeWidth = 8
``````