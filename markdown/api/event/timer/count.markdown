
# event.count

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [timer][api.event.timer]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          timer, count
> __See also__				[timer][api.event.timer]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The number of times that the timer has fired the listener. This is useful if you registered the timer to fire multiple times.

## Example

``````lua
local function listener( event )
    print( event.count )
end

timer.performWithDelay( 1000, listener )
``````