
# event.startPosition

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [userInput][api.event.userInput]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          userInput, startPosition
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The position where the cursor was when the event took place.


## Gotchas

This property is only available during the `"editing"` [phase][api.event.userInput.phase] of [userInput][api.event.userInput] events.


## Example
 
``````lua
local function textListener( event )
    if ( event.phase == "editing" ) then
        print( event.startPosition )
    end
end

defaultField = native.newTextField( 150, 150, 180, 30 )
defaultField:addEventListener( "userInput", textListener )
``````
