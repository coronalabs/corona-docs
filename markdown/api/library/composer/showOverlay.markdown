# composer.showOverlay()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, overlay, showOverlay
> __See also__          [composer.hideOverlay()][api.library.composer.hideOverlay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function loads an overlay scene above the currently active scene&nbsp;&mdash; <nobr>the "parent" scene &mdash;</nobr> leaving the parent scene intact.

When an overlay is shown, an overlay-specific scene `event` parameter, [event.parent][api.event.scene.show.parent], will be dispatched to the overlay scene. This parameter provides you with a reference to the parent scene object so that you may call functions/methods within it. See the [composer.hideOverlay()][api.library.composer.hideOverlay] documentation for a usage example.

This function supports all scene transition effects available for use with [composer.gotoScene()][api.library.composer.gotoScene].

To prevent touches on the overlay scene from passing through to underlying objects like buttons and widgets, set the `isModal` option to `true`.


## Gotchas

Only __one__ overlay scene can be shown at any time. If you call [composer.gotoScene()][api.library.composer.gotoScene], [composer.removeHidden()][api.library.composer.removeHidden], or attempt to show a different overlay scene, the current overlay will be hidden. As such, you should either hide an overlay scene before attempting to show a different overlay scene or change the active scene via [composer.gotoScene()][api.library.composer.gotoScene].


## Syntax

	composer.showOverlay( sceneName [, options] )

##### sceneName ~^(required)^~
_[String][api.type.String]._ The name of the scene to load as an overlay.

##### options ~^(optional)^~
_[Table][api.type.Table]._ This table contains several transition-related options such as the effect type, custom parameters, etc. See the [Overlay&nbsp;Options](#options) for the acceptable format of this table.


<a id="options"></a>

## Overlay Options

The `options` table can contain various options pertaining to the overlay:

``````lua
local options =
{
	isModal = true,
	effect = "fade",
	time = 400,
	params = {
		sampleVar1 = "my sample variable",
		sampleVar2 = "another sample variable"
	}
}
``````

##### isModal ~^(optional)^~
_[Boolean][api.type.Boolean]._ When set to `true`, this prevents touches from passing through the overlay scene to objects in the underlying scene. Default is `false`.

##### effect ~^(optional)^~
_[String][api.type.String]._ Specifies the effect for the overlay transition. See [composer.gotoScene()][api.library.composer.gotoScene] for a list of valid options. If no effect is specified, the overlay will appear instantaneously.

##### time ~^(optional)^~
_[Number][api.type.Number]._ The time duration for the effect, if a valid effect has been specified. Default is `500` milliseconds.

##### params ~^(optional)^~
_[Table][api.type.Table]._ An optional table containing any kind of custom data that should be transferred to the overlay. In the overlay scene, this data can be accessed via `event.params` in the [create][api.event.scene.create] event or [show][api.event.scene.show] event.


<a id="examples"></a>

## Example

``````lua
------------------------------------------------------------------------------
-- In "scene1.lua" (parent scene)
------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()

-- Custom function for resuming the game (from pause state)
function scene:resumeGame()
	-- Code to resume game
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

-- By some method such as a "pause" button, show the overlay
composer.showOverlay( "pause", options )

return scene


------------------------------------------------------------------------------
-- In "pause.lua"
------------------------------------------------------------------------------

local composer = require( "composer" )

local scene = composer.newScene()

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase
	local parent = event.parent  -- Reference to the parent scene object

	if ( phase == "will" ) then
		-- Call the "resumeGame()" function in the parent scene
		parent:resumeGame()
	end
end

-- By some method such as a "resume" button, hide the overlay
composer.hideOverlay( "fade", 400 )

scene:addEventListener( "hide", scene )
return scene
``````
