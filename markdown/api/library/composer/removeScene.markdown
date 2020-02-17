# composer.removeScene()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, remove, removeScene
> __See also__          [composer.removeHidden()][api.library.composer.removeHidden]
>								[composer.getSceneName][api.library.composer.getSceneName]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function removes the specified scene (or optionally recycles it). A [destroy][api.event.scene.destroy] event is first dispatched to the scene.

To recycle the scene instead of removing it entirely, you may set the `shouldRecycle` parameter to `true` &mdash; this means that the scene's `self.view` display group will be removed, but its scene object will remain in memory. This may improve loading time if you access the scene frequently. If `shouldRecycle` is omitted or set to `false` (default), the scene will be removed entirely, including its scene object.


## Syntax

	composer.removeScene( sceneName [, shouldRecycle] )

##### sceneName ~^(required)^~
_[String][api.type.String]._ The name of the scene to recycle or remove. For instance, if you want to recycle or remove `scene1.lua`, pass `"scene1"` as this parameter.

##### shouldRecycle ~^(optional)^~
_[Boolean][api.type.Boolean]._ If the scene should be recycled, but not removed entirely, set this parameter to `true`. Default is `false`.


## Examples

`````lua
-- Completely remove the scene, including its scene object
composer.removeScene( "scene1" )
`````

`````lua
-- Recycle the scene (its view is removed but its scene object remains in memory)
composer.removeScene( "scene1", true )
`````