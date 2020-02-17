
# event.newCharacters

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [userInput][api.event.userInput]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          userInput, newCharacters
> --------------------- ------------------------------------------------------------------------------------------

## Overview

New characters that were typed in for the event.


## Gotchas

This property is only available during the `"editing"` [phase][api.event.userInput.phase] of [userInput][api.event.userInput] events.


## Example
 
``````lua
local defaultField

local function textListener( event )
    if ( event.phase == "editing" ) then
        print( event.newCharacters )
    end
end

defaultField = native.newTextField( 150, 150, 180, 30 )
defaultField:addEventListener( "userInput", textListener )
``````
