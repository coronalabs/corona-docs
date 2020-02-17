
# event.time

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [relativeTouch][api.event.relativeTouch]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          touch, relativeTouch, time
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides an easy way to get the time in milliseconds since the start of the application, from within a relative touch event listener function.

## Example
 
``````lua
function printAppTimeOnTouch( event )
	if ( event.phase ~= "moved" ) then
		print( "Input " .. event.phase .. " " .. event.time .. " seconds after app started." )
	end
	return true
end
Runtime:addEventListener( "relativeTouch", printAppTimeOnTouch )
``````
