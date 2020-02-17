
# event.force

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [postCollision][api.event.postCollision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          postCollision, force
> __See also__			[event.friction][api.event.postCollision.friction]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The direct force of the post-collision as reported with the current event.

## Example
 
``````lua
local function onPostCollision( self, event )
	print( "force: " .. event.force )
	print( "friction: " .. event.friction )
end

object.postCollision = onPostCollision
object:addEventListener( "postCollision" )
``````