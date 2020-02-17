
# event.isShiftDown

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [key][api.event.key]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          key, isShiftDown
> __See also__			[event.isAltDown][api.event.key.isAltDown]
>						[event.isCtrlDown][api.event.key.isCtrlDown]
>						[event.isCommandDown][api.event.key.isCommandDown]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates if the Shift key was held down or if the Caps Lock key was on at the time the key event occurred. Note that this property is guaranteed to return `true` if the key that was just pressed down was `leftShift`, `rightShift`, or `capsLock`.

## Example
 
``````lua
-- Called when a key event has been received
local function onKeyEvent( event )
	if event.isShiftDown then
		-- The Shift was held down for the given key
	else
		-- The Shift was not held down for the given key
	end
	return false
end

-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )
``````
