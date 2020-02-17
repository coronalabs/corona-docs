
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [hide][api.event.scene.hide]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, hide, event
> --------------------- ------------------------------------------------------------------------------------------

## Overview

For the [hide][api.event.scene.hide] event, `event.phase` is the [string][api.type.String] value of `"will"` when the scene is on screen (but&nbsp;is about to go off&nbsp;screen). In contrast, `event.phase` will be the [string][api.type.String] value of `"did"` immediately after the scene goes off screen. If a scene transition effect is specified for the new scene or the overlay, the `"will"` phase is dispatched before the effect begins execution and the `"did"` phase is dispatched after the effect is finished.


## Example

``````lua
local composer = require( "composer" )
local scene = composer.newScene()

function scene:hide( event )

    local phase = event.phase

    if ( phase == "will" ) then
        -- Called when the scene is on screen (but is about to go off screen).
        -- Insert code here to "pause" the scene.
        -- Example: stop timers, stop animation, unload audio, etc.
    elseif ( phase == "did" ) then
        -- Called immediately after scene goes off screen.
    end
end
scene:addEventListener( "hide" )
``````
