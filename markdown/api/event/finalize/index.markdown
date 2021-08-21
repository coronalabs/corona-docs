
# finalize

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          finalize
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event is delivered to a display object when an object is removed from the scene, for example via [object:removeSelf()][api.type.DisplayObject.removeSelf]. This is useful if you have cleanup that needs to be performed when the associated object is removed from the scene.


## Properties

#### [event.name][api.event.finalize.name]

#### [event.target][api.event.finalize.target]


## Example

``````lua
local object = display.newImage( "ball.png" )

function object:finalize( event )
	print( "Finalizing:", self )
end

object:addEventListener( "finalize" )
object:removeSelf()
``````
