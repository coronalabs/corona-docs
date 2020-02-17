
# composer.getScene()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, getScene
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the specified scene object, as returned from [composer.newScene()][api.library.composer.newScene]. Returns `nil` if the scene object does not exist. This function is useful for getting a reference to a specific scene object &mdash; for instance, if the current scene needs access to a specific function that's attached to another scene.

## Syntax

	composer.getScene( sceneName )

##### sceneName ~^(required)^~
_[String][api.type.String]._ The name of the scene object.


## Example

`````lua
local composer = require( "composer" )

-- Get a reference to "titleScene"
local titleScene = composer.getScene( "titleScene" )
 
-- Call the following function (defined in "titleScene.lua")
titleScene.getUserPrefs()
`````