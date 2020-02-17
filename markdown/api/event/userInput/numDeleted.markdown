
# event.numDeleted

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [userInput][api.event.userInput]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          userInput, numDeleted
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The number of characters which were deleted.


## Gotchas

This property is only available during the `"editing"` [phase][api.event.userInput.phase] of [userInput][api.event.userInput] events.


## Example
 
``````lua
local defaultField

local function textListener( event )
    if ( event.phase == "editing" ) then
        print( event.numDeleted )
    end
end

defaultField = native.newTextField( 150, 150, 180, 30 )
defaultField:addEventListener( "userInput", textListener )
``````
