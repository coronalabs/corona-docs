
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [hide][api.event.scene.hide]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, hide, event
> --------------------- ------------------------------------------------------------------------------------------

## Overview

For the [hide][api.event.scene.hide] event, `event.name` is the [string][api.type.String] value `"hide"`. It can be accessed from the event listener for [hide][api.event.scene.hide] events that are dispatched to [scene][api.type.scene] objects.


## Example

``````lua
local composer = require( "composer" )
local scene = composer.newScene()

function scene:hide( event )
    print( event.name )
end
scene:addEventListener( "hide" )
``````