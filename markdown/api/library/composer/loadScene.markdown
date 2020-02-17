# composer.loadScene()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, load, loadScene
> __See also__          [composer.gotoScene()][api.library.composer.gotoScene]
>								[composer.showOverlay()][api.library.composer.showOverlay]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads the specified scene, hidden behind the current scene, without initiating a scene transition. This function is similar to [composer.gotoScene()][api.library.composer.gotoScene], but it does not change the currently active scene. Only the [create][api.event.scene.create] event will be dispatched on the scene, assuming its `self.view` does not already exist.

In addition, you can set an optional `doNotLoadView` flag when calling this function. Doing so will load only the scene's object, not its `self.view` display group.

This function is commonly used to "pre-load" a scene before initiating a transition on it, which would happen explicitly at a later time.

## Syntax

	composer.loadScene( sceneName [, doNotLoadView] [, params] )

##### sceneName ~^(required)^~
_[String][api.type.String]._ The name of the scene to load, hidden behind the current scene.

##### doNotLoadView ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set to `true` to load only the scene's object, not its `self.view` display group. Only the [create][api.event.scene.create] event will be dispatched on the scene, assuming its `self.view` does not already exist.

##### params ~^(optional)^~
_[Table][api.type.Table]._ An optional table containing any kind of custom data that should be transferred to the scene. In the specified scene, this data can be accessed via `event.params` in the [create][api.event.scene.create] event, unless `doNotLoadView` is set to `true`).


## Example

`````lua
local composer = require( "composer" )

local currentScore = 200

-- Pre-load the scene, hidden behind the current scene
local options = { level="Level 1", score=currentScore }
local results = composer.loadScene( "results", false, options )

-- Later, transition to the hidden scene (no loading necessary)
composer.gotoScene( "results", "fade", 800 )
`````