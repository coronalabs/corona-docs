# composer.removeHidden()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, remove, removeHidden
> __See also__          [composer.removeScene()][api.library.composer.removeScene]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function removes (or optionally recycles) all scenes __except__ for the currently active scene. A [destroy][api.event.scene.destroy] event is first dispatched to all of these scenes.

To recycle the scenes instead of removing them entirely, you may set the `shouldRecycle` parameter to `true` &mdash; this means that each scene's `self.view` display group will be removed, but their scene objects will remain in memory. If `shouldRecycle` is omitted or set to `false` (default), the scenes will be removed entirely, including their scene objects.


## Syntax

	composer.removeHidden( [shouldRecycle] )

##### shouldRecycle ~^(optional)^~
_[Boolean][api.type.Boolean]._ If the scenes should be recycled, but not removed entirely, set this parameter to `true`. Default is `false`.


## Examples

`````lua
-- Completely removes all scenes except for the currently active scene
composer.removeHidden()
`````

`````lua
-- Recycles all scenes except for the currently active scene
composer.removeHidden( true )
`````