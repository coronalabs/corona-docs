
# display.newPolygon()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [ShapeObject][api.type.ShapeObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          shape, polygon, vector
> __See also__          [Shapes &mdash; Paths, Fills, Strokes][guide.graphics.path] _(guide)_
>						[Display Objects][guide.media.displayObjects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Draws a polygon shape by providing the outline (contour) of the shape. This includes convex or concave shapes. Self-intersecting shapes, however, are not supported and will result in undefined behavior.

The local origin is at the center of the polygon and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.


## Syntax

	display.newPolygon( [parent,] x, y, vertices )


##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the polygon.

##### x / y ~^(required)^~
_[Numbers][api.type.Number]._ The location of the object relative to its parent.

##### vertices ~^(required)^~
_[Array][api.type.Array]._ An array of __x__ and __y__ coordinates. These coordinates will automatically be re-centered about the center of the polygon.


## Gotchas

If an invalid polygon is requested, for example a polygon with intersecting lines, it may not render properly. Similarly, if any coordinate points are duplicated, including the first or last point, the polygon will be invalid. For correct results, you must specify valid polygon coordinates.


## Example

`````lua
local halfW = display.contentWidth * 0.5
local halfH = display.contentHeight * 0.5

local vertices = { 0,-110, 27,-35, 105,-35, 43,16, 65,90, 0,45, -65,90, -43,15, -105,-35, -27,-35, }

local o = display.newPolygon( halfW, halfH, vertices )
o.fill = { type="image", filename="mountains.png" }
o.strokeWidth = 10
o:setStrokeColor( 1, 0, 0 )
`````

![][images.sdk.graphics.polygon-star]