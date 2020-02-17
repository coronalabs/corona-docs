# math.cos()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          cosine, cos
> __See also__          [math.acos()][api.library.math.acos]<br/>[math.pi][api.library.math.pi]<br/>[math.sin()][api.library.math.sin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the cosine of `x` (the angle in radians). The result is a number in the range `[-1, 1]`.

## Syntax

	math.cos( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ The angle in radians.


## Example

``````lua
-- animate a circle along a path
local ox, oy = display.contentCenterX, display.contentCenterY

local myCircle = display.newCircle( ox, oy, 20 )
myCircle:setFillColor( 1, 0, 0 )

local function onFrame( event )
    myCircle.x = ( myCircle.x + 5 ) % display.viewableContentWidth
    myCircle.y = oy - math.cos( myCircle.x/20 ) * 100.0
end
Runtime:addEventListener( "enterFrame", onFrame )
``````
