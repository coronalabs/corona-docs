
# event.isCommandDown

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [key][api.event.key]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          key, isCommandDown
> __See also__			[event.isAltDown][api.event.key.isAltDown]
>						[event.isCtrlDown][api.event.key.isCtrlDown]
>						[event.isShiftDown][api.event.key.isShiftDown]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates if the Command/⌘ or Windows key was held down at the time the key event occurred.


## Example
 
``````lua
-- Called when a key event has been received
local function onKeyEvent( event )
	if event.isCommandDown then
		-- The Command/Windows key was held down for the given key
	else
		-- The Command/Windows key was not held down for the given key
	end
	return false
end

-- Add the key event listener
Runtime:addEventListener( "key", onKeyEvent )
``````