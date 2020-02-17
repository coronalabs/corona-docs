# composer.gotoScene()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene switching, gotoScene
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function is used to transition to a specific scene. When called, the [hide][api.event.scene.hide] event is dispatched to the current scene (if&nbsp;one&nbsp;exists). If a `self.view` group does not already exist for the specified target scene, the [create][api.event.scene.create] event will be dispatched to that scene, then the [show][api.event.scene.show] event will be dispatched.


## Syntax

	composer.gotoScene( sceneName [, options] )

##### sceneName ~^(required)^~
_[String][api.type.String]._ The name of the scene to go to. In many cases, this is the name of the scene's Lua file (without&nbsp;the `.lua`&nbsp;extension).

##### options ~^(optional)^~
_[Table][api.type.Table]._ This table contains several transition-related options such as the effect type, custom parameters, etc. See the [Scene&nbsp;Options](#options) for the acceptable format of this table.


<a id="options"></a>

## Scene Options

The `options` table can contain various options pertaining to the target scene:

``````lua
local options =
{
    effect = "fade",
    time = 400,
    params = {
        sampleVar1 = "my sample variable",
        sampleVar2 = "another sample variable"
    }
}
``````

##### effect ~^(optional)^~
_[String][api.type.String]._ Specifies the effect for the scene transition. See [Transition&nbsp;Effects](#effects) for a list of valid options. If no effect is specified, the scene transition will occur instantaneously.

##### time ~^(optional)^~
_[Number][api.type.Number]._ The time duration for the effect, if a valid effect has been specified. Default is `500` milliseconds.

##### params ~^(optional)^~
_[Table][api.type.Table]._ An optional table containing any kind of custom data that should be transferred to the scene. In the specified scene, this data can be accessed via `event.params` in the [create][api.event.scene.create] event or [show][api.event.scene.show] event.


<a id="effects"></a>

## Transition Effects

The following string values are supported for the `effect` key of the `options` table:

* `"fade"`
* `"crossFade"`
* `"zoomOutIn"`
* `"zoomOutInFade"`
* `"zoomInOut"`
* `"zoomInOutFade"`
* `"flip"`
* `"flipFadeOutIn"`
* `"zoomOutInRotate"`
* `"zoomOutInFadeRotate"`
* `"zoomInOutRotate"`
* `"zoomInOutFadeRotate"`
* `"fromRight"` &mdash; over current scene
* `"fromLeft"` &mdash; over current scene
* `"fromTop"` &mdash; over current scene
* `"fromBottom"` &mdash; over current scene
* `"slideLeft"` &mdash; pushes current scene off
* `"slideRight"` &mdash; pushes current scene off
* `"slideDown"` &mdash; pushes current scene off
* `"slideUp"` &mdash; pushes current scene off


## Examples

##### Going to Another Scene

``````lua
local composer = require( "composer" )

local currentScore = 200

-- Later...
local options = {
    effect = "fade",
    time = 800,
    params = { level="Level 1", score=currentScore }
}
composer.gotoScene( "results", options )
``````

##### Reloading the Current Scene

``````lua
local composer = require( "composer" )

-- Later...
local currScene = composer.getSceneName( "current" )
composer.gotoScene( currScene )
``````
