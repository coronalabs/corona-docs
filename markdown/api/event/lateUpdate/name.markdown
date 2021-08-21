
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [lateUpdate][api.event.lateUpdate]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          lateUpdate, name
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The value of `event.name` is `"lateUpdate"` when used with the [Runtime:addEventListener()][api.type.EventDispatcher.addEventListener] method to call the event listener function every frame.

## Example
 
``````lua
local function myListener( event )
	print( "Listener called with event of type " .. event.name )
end
Runtime:addEventListener( "lateUpdate", myListener )
``````
