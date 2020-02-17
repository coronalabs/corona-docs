# composer.recycleOnSceneChange

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Library__           [composer.*][api.library.composer]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, recycle, recycleOnSceneChange
> __See also__          [composer.removeScene()][api.library.composer.removeScene]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

By default, when changing scenes, Composer keeps the current scene's view (`self.view`) in memory, which can improve performance if you access the same scenes frequently. If you set `composer.recycleOnSceneChange` to `true`, the scene's `self.view` display group will be removed, but its scene object will remain in memory. The default value is `false`.

## Syntax

	composer.recycleOnSceneChange

## Example

`````lua
-- Enable auto-recycle on scene change
composer.recycleOnSceneChange = true
`````