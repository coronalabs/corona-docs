
# composer.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene
> __See also__          [Composer Library][guide.system.composer] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Composer is the official scene (screen) creation and management library in CORONA_CORE_PRODUCT. This library provides developers with an easy way to create and transition between individual scenes.

The primary object in the Composer library is the `scene` object. This is an event listener that responds to specific events, and it contains a unique `self.view` property which is a reference to the [display&nbsp;group][api.type.GroupObject] associated with the scene. This `self.view` is where you should insert visual elements pertaining to the scene.

See the [Scene&nbsp;Template](#template) section below for an example of how a scene file might be structured. For more information on scene events, including names and dispatch order, see the [scene&nbsp;events][api.event.scene] documentation.


## Functions

#### [composer.getScene()][api.library.composer.getScene]

#### [composer.getSceneName()][api.library.composer.getSceneName]

#### [composer.getVariable()][api.library.composer.getVariable]

#### [composer.gotoScene()][api.library.composer.gotoScene] 

#### [composer.hideOverlay()][api.library.composer.hideOverlay]

#### [composer.loadScene()][api.library.composer.loadScene]

#### [composer.newScene()][api.library.composer.newScene]

#### [composer.removeHidden()][api.library.composer.removeHidden]

#### [composer.removeScene()][api.library.composer.removeScene]

#### [composer.setVariable()][api.library.composer.setVariable]

#### [composer.showOverlay()][api.library.composer.showOverlay]


## Properties

#### [composer.isDebug][api.library.composer.isDebug]

#### [composer.recycleOnLowMemory][api.library.composer.recycleOnLowMemory]

#### [composer.recycleOnSceneChange][api.library.composer.recycleOnSceneChange]

#### [composer.stage][api.library.composer.stage]


<a id="template"></a>

## Scene Template

The following template can be used to create new scene files. Note that this template includes listener functions for all potential events in the scene, but you only need to include listeners for the events that you want to handle.

``````lua
local composer = require( "composer" )

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

	local sceneGroup = self.view
	-- Code here runs when the scene is first created but has not yet appeared on screen

end


-- show()
function scene:show( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is still off screen (but is about to come on screen)

	elseif ( phase == "did" ) then
		-- Code here runs when the scene is entirely on screen

	end
end


-- hide()
function scene:hide( event )

	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
		-- Code here runs when the scene is on screen (but is about to go off screen)

	elseif ( phase == "did" ) then
		-- Code here runs immediately after the scene goes entirely off screen

	end
end


-- destroy()
function scene:destroy( event )

	local sceneGroup = self.view
	-- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
``````
