
# event.tapCount

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [relativeTouch][api.event.relativeTouch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, relativeTouch, tapCount
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The number of taps on the device.

## Gotchas

The tap count is only provided on the `"ended"` [phase][api.event.relativeTouch.phase].

## Example

``````lua
local function tapListener( event )
	if ( event.tapCount ) then
		print( event.tapCount )
	end
end
Runtime:addEventListener( "relativeTouch", tapListener )
``````
