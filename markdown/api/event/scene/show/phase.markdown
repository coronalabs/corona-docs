
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [show][api.event.scene.show]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, show, event
> --------------------- ------------------------------------------------------------------------------------------

## Overview

For the [show][api.event.scene.show] event, `event.phase` is the [string][api.type.String] value of `"will"` if the scene is about to become active, or `"did"` after the scene comes on screen. It can be accessed from the event listener for [show][api.event.scene.show] events that are dispatched to [scene][api.type.scene] objects. If a scene transition effect is specified, the `"will"` phase is dispatched before the scene effect begins execution. In contrast, the `"did"` phase is not dispatched until after the effect is finished.

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

    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is still off screen (but is about to come on screen).
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen.
        -- Insert code here to make the scene come alive.
        -- Example: start timers, begin animation, play audio, etc.
    end
end

scene:addEventListener( "show" )
``````
