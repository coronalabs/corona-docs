
# display.newCircle()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      [ShapeObject][api.type.ShapeObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          circle, vector object
> __See also__          [Shapes &mdash; Paths, Fills, Strokes][guide.graphics.path] _(guide)_
>						[Display Objects][guide.media.displayObjects] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a circle with radius centered at specified coordinates (`xCenter`, `yCenter`). The local origin is at the center of the circle and the [anchor point][guide.graphics.transform-anchor] is initialized to this local origin.


## Gotchas

Vector circles of very small radius <nobr>(less than `10` for example)</nobr> may appear as <nobr>multi-sided</nobr> polygons instead of smooth circles. This will be more apparent if your content area is smaller than the device's native resolution. In these cases, if you want to display a very small circle, it may be better to use a circular image instead of a vector.


## Syntax

	display.newCircle( [parent,] xCenter, yCenter, radius )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the circle.

##### xCenter / yCenter ~^(required)^~
_[Numbers][api.type.Number]._ The __x__ and __y__ coordinates for the center of the circle.

##### radius ~^(required)^~
_[Number][api.type.Number]._ The radius for the circle. This must be greater than `0`.


## Properties

_(Inherits properties from [ShapeObject][api.type.ShapeObject])_

Shape objects have a `path` property that exposes properties of the path:

##### object.path.radius
_[Number][api.type.Number]._ Radius of the circle.


## Examples

`````lua
local myCircle = display.newCircle( 100, 100, 30 )
myCircle:setFillColor( 0.5 )
`````

`````lua
myCircle.strokeWidth = 5
myCircle:setStrokeColor( 1, 0, 0 )
`````
