# object:scale()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [DisplayObject][api.type.DisplayObject]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          scale
> __See also__          [object.xScale][api.type.DisplayObject.xScale]
>						[object.yScale][api.type.DisplayObject.yScale]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Effectively multiplies the size of a display object by `xScale` and `yScale` respectively. The scaling occurs around the object's anchor point.

Valid examples include `1.0` for 100%, `2.0` for 200%, or `0.5` for 50%.

You can flip a [display object][api.type.DisplayObject] horizontally or vertically by passing a negative value to [object:scale()][api.type.DisplayObject.scale] as seen in the example below.


## Gotchas

* Changing the scale factor of a display object is not reflected in the [object.width][api.type.DisplayObject.width] or [object.height][api.type.DisplayObject.height] properties of the object. Only [object.contentWidth][api.type.DisplayObject.contentWidth] and [object.contentHeight][api.type.DisplayObject.contentHeight] are affected.

* When a display object is converted into a physics object, scaling the object will change the visual size, but it will __not__ affect how the physics engine regards the object size. This could result in unpredictable results when interacting with other physics bodies.


## Syntax

	object:scale( xScale, yScale )

##### xScale, yScale ~^(required)^~
_[Numbers][api.type.Number]._ Factors by which to change the scale in the __x__ and __y__ directions respectively.


## Examples

##### Normal Scaling

``````lua
local star = display.newImage( "star.png" )

-- Scale the image by 200% (x) and 50% (y)
star:scale( 2, 0.5 )
``````

##### Image Flip

``````lua
local star = display.newImage( "star.png" )

-- Flip the image vertically and horizontally
star:scale( -1, -1 )
``````
