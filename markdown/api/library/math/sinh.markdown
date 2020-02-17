# math.sinh()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          hyperbolic sine, sinh, sine, sin
> __See also__          [math.cosh()][api.library.math.cosh]<br/>[math.sin()][api.library.math.sin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the hyperbolic sine of `x`.

## Syntax

	math.sinh( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Example

``````lua
-- move a circle along a path
local myCircle = display.newCircle( 0, display.viewableContentHeight/2, 20 )
myCircle:setFillColor( 1, 0, 0 )
local function onFrame(event)
    myCircle.y = display.viewableContentHeight/2 - math.sinh(15*(myCircle.x/display.viewableContentWidth-0.5))
    myCircle.x = (myCircle.x + 5) % display.viewableContentWidth
end
Runtime:addEventListener( "enterFrame", onFrame )
``````
