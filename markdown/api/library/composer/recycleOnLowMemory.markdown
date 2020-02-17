# composer.recycleOnLowMemory

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, recycle, recycleOnLowMemory
> __See also__          [composer.removeScene()][api.library.composer.removeScene]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

If the OS issues a low memory warning, Composer will automatically recycle the scene used least recently (that scene's `self.view` will be removed). If you prefer to disable <nobr>auto-recycling</nobr> functionality, set this property to `false`. Default is `true`.

## Syntax

	composer.recycleOnLowMemory

## Example

`````lua
-- Turn off auto-recycle on low memory (recommended only for advanced situations)
composer.recycleOnLowMemory = false
`````