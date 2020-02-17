
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [enterFrame][api.event.enterFrame]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          enterFrame, name
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The value of `event.name` is `"enterFrame"` when used with the [Runtime:addEventListener()][api.type.EventDispatcher.addEventListener] method to call the event listener function every frame.

## Example
 
``````lua
local function myListener( event )
	print( "Listener called with event of type " .. event.name )
end
Runtime:addEventListener( "enterFrame", myListener )
``````
