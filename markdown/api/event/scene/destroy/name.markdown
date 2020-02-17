
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [destroy][api.event.scene.destroy]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, destroy, event
> --------------------- ------------------------------------------------------------------------------------------

## Overview

For the [destroy][api.event.scene.destroy] event, `event.name` is the [string][api.type.String] value `"destroy"`. It can be accessed from the event listener for [destroy][api.event.scene.destroy] events that are dispatched to [scene][api.type.scene] objects.


## Example

``````lua
local composer = require( "composer" )
local scene = composer.newScene()

function scene:destroy( event )
    print( event.name )
end
scene:addEventListener( "destroy" )
``````