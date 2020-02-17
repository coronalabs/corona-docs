
# display.newRoundedRect()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [ShapeObject][api.type.ShapeObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          rounded rectangle, rectangle, vector object
> __See also__          [Shapes &mdash; Paths, Fills, Strokes][guide.graphics.path] _(guide)_
>						[Display Objects][guide.media.displayObjects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a rounded rectangle object. The corners are rounded by quarter circles of a specified radius value. The local origin is at the center of the rectangle and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.


## Gotchas

If the corner radius is greater than half of the rectangle's width or height, the actual radius will be decreased so that the rounded rectangle is rendered as a "capsule" shape.


## Syntax

	display.newRoundedRect( [parent,] x, y, width, height, cornerRadius )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the rounded rectangle.

##### x / y ~^(required)^~
_[Numbers][api.type.Number]._ The __x__ and __y__ coordinates for the center of the rectangle.

##### width / height ~^(required)^~
_[Numbers][api.type.Number]._ Width and height of the rectangle.

##### cornerRadius ~^(required)^~
_[Number][api.type.Number]._ Corners are rounded by quarter circles of this radius value.


## Properties

_(Inherits properties from [ShapeObject][api.type.ShapeObject])_

Rounded rectangle objects have a `path` property which lets you modify the radius, width, and height:

##### object.path.radius
_[Number][api.type.Number]._ Radius of the corners. This cannot be set to a value larger than half the width or height of the rectangle.

##### object.path.height
_[Number][api.type.Number]._ Height of the rectangle.

##### object.path.width
_[Number][api.type.Number]._ Width of the rectangle.


## Example

`````lua
local myRoundedRect = display.newRoundedRect( 0, 0, 150, 50, 12 )
myRoundedRect.strokeWidth = 3
myRoundedRect:setFillColor( 0.5 )
myRoundedRect:setStrokeColor( 1, 0, 0 )
`````
