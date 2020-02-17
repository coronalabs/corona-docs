
# display.newRect()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [ShapeObject][api.type.ShapeObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rectangle, vector object
> __See also__          [Shapes &mdash; Paths, Fills, Strokes][guide.graphics.path] _(guide)_
>						[Display Objects][guide.media.displayObjects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a rectangle object. The local origin is at the center of the rectangle and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.


## Syntax

	display.newRect( [parent,] x, y, width, height )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the rectangle.

##### x / y ~^(required)^~
_[Number][api.type.Number]._ The __x__ and __y__ coordinates for the center of the rectangle.

##### width / height ~^(required)^~
_[Number][api.type.Number]._ Width and height of the rectangle.


## Properties

_(Inherits properties from [ShapeObject][api.type.ShapeObject])_

Shape objects have a `path` property that exposes properties of the path. The first corner is at the top-left and they go around in counter-clockwise order.

##### object.path.x1 / object.path.y1
_[Number][api.type.Number]._ The top-left corner. By default, `(0,0)`.

##### object.path.x2 / object.path.y2
_[Number][api.type.Number]._ The bottom-left corner. By default, `(0,0)`.

##### object.path.x3 / object.path.y3
_[Number][api.type.Number]._ The bottom-right corner. By default, `(0,0)`.

##### object.path.x4 / object.path.y4
_[Number][api.type.Number]._ The top-right corner. By default, `(0,0)`.

![Quadrilateral Distortion][images.sdk.graphics.rect-3D]


## Example

`````lua
local myRectangle = display.newRect( 0, 0, 150, 50 )
myRectangle.strokeWidth = 3
myRectangle:setFillColor( 0.5 )
myRectangle:setStrokeColor( 1, 0, 0 )
`````
