
# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [gameNetwork][api.event.gameNetwork]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Game Center, type
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The name of the operation that generated the event.

## Example
 
``````lua
-- Request callback function
local function requestCallback( event )

	print( event.type )  --> "resetAchievements"
end

-- Reset the player's achievement list
gameNetwork.request( "resetAchievements", { listener=requestCallback } )
``````
