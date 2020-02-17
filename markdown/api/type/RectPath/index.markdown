# RectPath

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [Path][api.type.Path]
> __Library__           [display.*][api.library.display]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__			[display.newRect()][api.library.display.newRect]
>						[Perspective and Depth][guide.graphics.3D] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The rectangle path specifies the geometry of the corresponding [rectangle][api.library.display.newRect] object.

This path has limited properties which let you manipulate specific aspects of the shape object. These aspects can either be set explicitly or animated via a [transition][guide.media.transitionLib].


## Properties

_(Inherits properties from [Path][api.type.Path])_

##### path.height
_[Number][api.type.Number]._ Height of the rectangle.

##### path.width
_[Number][api.type.Number]._ Width of the rectangle.

### Quadrilateral Distortion

The following properties allow you to distort the corners of a rectangle by specifying offsets. The corners are ordered starting with the <nobr>top-left</nobr> and going around in <nobr>counter-clockwise</nobr> order (see&nbsp;diagram&nbsp;below).

Learn more about 2.5D/3D effects in the [Perspective and Depth][guide.graphics.3D] guide.

##### path.x1, path.y1
_[Numbers][api.type.Number]._ The offset for the top-left corner. Defaults are `0,0`.

##### path.x2, path.y2
_[Numbers][api.type.Number]._ The offset for the bottom-left corner. Defaults are `0,0`.

##### path.x3, path.y3
_[Numbers][api.type.Number]._ The offset for the bottom-right corner. Defaults are `0,0`.

##### path.x4, path.y4
_[Numbers][api.type.Number]._ The offset for the top-right corner. Defaults are `0,0`.

![][images.sdk.graphics.rect-3D]


## Example

``````lua
local rect = display.newRect( 160, 240, 150, 50 )
rect.path.x1 = -50

transition.to( rect.path, { time=2000, height=100, x1=0 } )
``````
