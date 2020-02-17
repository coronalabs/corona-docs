# object.gravityScale

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [Body][api.type.Body]
> __Library__           [physics.*][api.library.physics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          body, gravityScale
> __See also__          [physics.setGravity()][api.library.physics.setGravity]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Use the `gravityScale` property to adjust the gravity on a single body. For example, setting it to `0` makes the body float (no&nbsp;gravity). The default value is `1.0` which means the body will behave under the normal simulated gravity.


## Gotchas

* This can be a negative value which will effectively reverse the object's normal gravity.

* Increased gravity can decrease physics stability, so you should set this property conservatively.


## Example

``````lua
-- Create a rectangle
local myRect = display.newRect( 0, 0, 100, 100 )

-- Add a body to the rectangle
physics.addBody( myRect, "dynamic" )

-- Set gravity scale
myRect.gravityScale = 0.25
``````