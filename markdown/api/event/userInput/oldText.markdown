
# event.oldText

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [userInput][api.event.userInput]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          userInput, oldText
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The characters present in the [TextField][api.type.TextField] or [TextBox][api.type.TextBox] before any new characters were typed for the event.


## Gotchas

* This property is only available during the `"editing"` [phase][api.event.userInput.phase] of [userInput][api.event.userInput] events.

* This property is only available on devices, not in the Corona Simulator.


## Example
 
``````lua
local defaultField

local function textListener( event )
	if ( event.phase == "editing" ) then
		print( event.oldText )
	end
end

defaultField = native.newTextField( 150, 150, 180, 30 )
defaultField:addEventListener( "userInput", textListener )
``````
