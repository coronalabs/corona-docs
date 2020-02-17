# composer.getSceneName()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, getSceneName
> __See also__          [composer.gotoScene()][api.library.composer.gotoScene]
>								[composer.removeScene()][api.library.composer.removeScene]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the current, previous, or overlay scene name as a string. This can then be used with [composer.gotoScene()][api.library.composer.gotoScene] or [composer.removeScene()][api.library.composer.removeScene].

## Syntax

	composer.getSceneName( sceneType )

##### sceneType ~^(required)^~
_[String][api.type.String]._ The name of the scene you want to retrieve. Possible values are `"current"`, `"previous"`, or `"overlay"`.

## Examples

`````lua
local prevScene = composer.getSceneName( "previous" )

-- Later...
composer.gotoScene( prevScene )
`````

`````lua
local currScene = composer.getSceneName( "current" )

composer.removeScene( currScene )
`````