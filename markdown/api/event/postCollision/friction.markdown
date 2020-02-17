
# event.friction

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [postCollision][api.event.postCollision]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          postCollision, friction
> __See also__			[event.force][api.event.postCollision.force]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The frictional force of the post-collision as reported with the current event.

## Example

``````lua
local function onPostCollision( self, event )
	print( "friction: " .. event.friction )
	print( "force: " .. event.force )
end

object.postCollision = onPostCollision
object:addEventListener( "postCollision" )
``````