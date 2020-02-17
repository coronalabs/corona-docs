
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [create][api.event.scene.create]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, create, event
> --------------------- ------------------------------------------------------------------------------------------

## Overview

For the [create][api.event.scene.create] event, `event.name` is the [string][api.type.String] value `"create"`. It can be accessed from the event listener for [create][api.event.scene.create] events that are dispatched to [scene][api.type.scene] objects.

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

function scene:create( event )
    print( event.name )
end
scene:addEventListener( "create" )
``````