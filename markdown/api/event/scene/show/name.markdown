
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [show][api.event.scene.show]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, show, event
> --------------------- ------------------------------------------------------------------------------------------

## Overview

For the [show][api.event.scene.show] event, `event.name` is the [string][api.type.String] value `"show"`. It can be accessed from the event listener for [show][api.event.scene.show] events that are dispatched to [scene][api.type.scene] objects.


## Example

``````lua
--------------------------
-- From "scene1.lua"
--------------------------
composer.gotoScene( "scene2", { effect="fade", time=800 } )

--------------------------
-- In "scene2.lua"
--------------------------
local composer = require( "composer" )
local scene = composer.newScene()

function scene:show( event )
    print( event.name )
end
scene:addEventListener( "show" )
``````