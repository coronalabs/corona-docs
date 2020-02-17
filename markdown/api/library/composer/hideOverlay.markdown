# composer.hideOverlay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, overlay, hideOverlay
> __See also__          [composer.showOverlay()][api.library.composer.showOverlay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function hides/removes the current overlay scene (see [composer.showOverlay()][api.library.composer.showOverlay]), if one is being displayed.

When an overlay is hidden, an overlay-specific scene `event` parameter, [event.parent][api.event.scene.hide.parent], will be dispatched to the overlay scene. This parameter provides you with a reference to the parent scene object so that you may call functions/methods within it. See the [Example](#examples) section for a usage case.


## Syntax

	composer.hideOverlay( [recycleOnly] [, effect] [, time] )

##### recycleOnly ~^(optional)^~
_[Boolean][api.type.Boolean]._ If set to `true`, the scene will only be recycled (the `self.view` display group will be removed, but the scene object will remain in memory). Setting this to `true` is useful if you intend to show the overlay again in the near future. Default is `false`, meaning that the overlay scene will be completely removed, including its scene object. 

##### effect ~^(optional)^~
_[String][api.type.String]._ The visual transition effect applied to the overlay before it is hidden. A list of transition effects can be seen in the [composer.gotoScene()][api.library.composer.gotoScene] documentation.

##### time ~^(optional)^~
_[Number][api.type.Number]._ The time duration for the effect, if a valid effect has been specified. Default is `500` milliseconds.


<a id="examples"></a>

## Example

``````lua
-- ----------------------------------------------------------------------------
-- In "scene1.lua" (parent scene)
-- ----------------------------------------------------------------------------
local composer = require( "composer" )

local scene = composer.newScene()

-- Custom function for resuming the game (from pause state)
function scene:resumeGame()
    --code to resume game
end

-- Options table for the overlay scene "pause.lua"
local options = {
    isModal = true,
    effect = "fade",
    time = 400,
    params = {
        sampleVar = "my sample variable"
    }
}

-- By some method (a pause button, for example), show the overlay
composer.showOverlay( "pause", options )

return scene

-- ----------------------------------------------------------------------------
-- In "pause.lua"
-- ----------------------------------------------------------------------------
local composer = require( "composer" )

local scene = composer.newScene()

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase
    local parent = event.parent  --reference to the parent scene object
        
    if ( phase == "will" ) then
        -- Call the "resumeGame()" function in the parent scene
        parent:resumeGame()
    end
end

-- By some method (a "resume" button, for example), hide the overlay
composer.hideOverlay( "fade", 400 )

scene:addEventListener( "hide", scene )
return scene
``````
