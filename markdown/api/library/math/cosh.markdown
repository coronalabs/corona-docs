# math.cosh()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [math.*][api.library.math]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          hyperbolic cosine, cosh, cosine, cos
> __See also__          [math.sinh()][api.library.math.sinh]<br/>[math.cos()][api.library.math.cos]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the hyperbolic cosine of `x`.

## Syntax

	math.cosh( x )

##### x ~^(required)^~
_[Number][api.type.Number]._ A number.


## Example

``````lua
-- move a circle along a path
local myCircle = display.newCircle( 0, display.viewableContentHeight/2, 20 )
myCircle:setFillColor( 1, 0, 0 )
local function onFrame( event )
    myCircle.y = math.cosh( 15*(myCircle.x/display.viewableContentWidth-0.5) )
    myCircle.x = (myCircle.x + 5) % display.viewableContentWidth
end
Runtime:addEventListener( "enterFrame", onFrame )
``````
