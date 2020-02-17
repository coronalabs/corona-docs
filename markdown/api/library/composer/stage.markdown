# composer.stage

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [DisplayObject][api.type.DisplayObject]
> __Library__           [composer.*][api.library.composer]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, stage, group
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a reference to the top-level Composer display group which all scene views are inserted into. This can be considered as the "Composer&nbsp;scene&nbsp;layer" and it's useful if you need to place display objects above or below all Composer scenes, even during transition effects. For example:

* A background image that is displayed behind all Composer scenes and remains static, even during scene transitions.
* A tab or UI bar that appears above all Composer scenes.
* HUD (heads-up display) elements such as health, score, etc.


## Syntax

	composer.stage


## Example

`````lua
local composer = require( "composer" )

-- Create a background which should appear behind all scenes
local background = display.newImage( "bg.png" )
 
-- Create a "health meter" image which should appear above all scenes
local meter = display.newImage( "health100.png" )
meter.anchorX = 0
meter.anchorY = 1
meter.x, meter.y = 20, display.contentHeight-20

-- Sort everything in the correct z-index order
local stage = display.getCurrentStage()
stage:insert( background )
stage:insert( composer.stage )
stage:insert( meter )

-- Open the initial scene
composer.gotoScene( "scene1", "fade", 800 )
`````