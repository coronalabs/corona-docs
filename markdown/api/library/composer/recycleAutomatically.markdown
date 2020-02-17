# composer.recycleAutomatically

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Library__           [composer.*][api.library.composer]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          composer, scene, recycle, recycleAutomatically
> __See also__          [composer.removeScene()][api.library.composer.removeScene]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

If this property is set to `true` (default), the scene used least recently will be automatically recycled if the OS issues a low memory warning. If you prefer to manage the recycling of scenes manually and disable the <nobr>auto-recycling</nobr> functionality, set this property to `false`.

## Syntax

	composer.recycleAutomatically

## Example

`````lua
-- Turn off auto-recycle on low memory warning
composer.recycleAutomatically = false
`````