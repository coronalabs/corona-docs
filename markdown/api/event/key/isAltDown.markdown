
# event.isAltDown

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [key][api.event.key]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          key, isAltDown
> __See also__			[event.isCtrlDown][api.event.key.isCtrlDown]
>						[event.isShiftDown][api.event.key.isShiftDown]
>						[event.isCommandDown][api.event.key.isCommandDown]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates if the Alt key was held down at the time the key event occurred. Note that this property is guaranteed to return `true` if the key that was just pressed down was either `leftAlt` or `rightAlt`.


## Example
 
``````lua
-- Called when a key event has been received
local function onKeyEvent( event )
	if ( event.isAltDown ) then
		-- The Alt key was held down for the given key
	else
		-- The Alt key was not held down for the given key
	end
	return false
end

-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )
``````