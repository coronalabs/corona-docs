# math.sin()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          sine, sin
> __See also__          [math.asin()][api.library.math.asin]<br/>[math.pi][api.library.math.pi]<br/>[math.cos()][api.library.math.cos]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the sine of `x` (the angle in radians). The result is a number in the range `[-1, 1]`.

## Syntax

	math.sin( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ The angle in radians.


## Example

``````lua
-- move a circle along a path
local myCircle = display.newCircle( 0, display.viewableContentHeight/2, 20 )
local t, p = 0, 0.7
myCircle:setFillColor( 1, 0, 0 )
local function onFrame( event )
    myCircle.x = display.viewableContentWidth/2 + 100 * math.cos(10*t - p)
    myCircle.y = display.viewableContentHeight/2 - 100 * math.sin(10*t)
    t = t + 5
end
Runtime:addEventListener( "enterFrame", onFrame )
``````
