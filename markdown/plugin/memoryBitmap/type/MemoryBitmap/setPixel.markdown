# MemoryBitmap:setPixel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          MemoryBitmap, setPixel
> __See also__          [MemoryBitmap][plugin.memoryBitmap.type.MemoryBitmap]
>						[MemoryBitmap:getPixel()][plugin.memoryBitmap.type.MemoryBitmap.getPixel]
>						[memoryBitmap.newTexture()][plugin.memoryBitmap.newTexture]
>						[memoryBitmap.*][plugin.memoryBitmap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets a bitmap pixel to a specific color.


## Syntax

	bitmap:setPixel( x, y, r, g, b, a )
	bitmap:setPixel( x, y, color )


##### x, y ~^(required)^~
_[Numbers][api.type.Number]._ The __x__ and __y__ pixel coordinates to be changed.

##### r, g, b, a ~^(required)^~
_[Numbers][api.type.Number]._ The red, green, blue and alpha components to set the bitmap pixel to. Values should be in the range of `0` to `1`. Depending on the bitmap `format`, some components may be ignored&nbsp;&mdash; for example, a `format` of `"rgb"` uses only `r`, `g` and `b`, while a `format` of `"mask"` ignores everything but `r`.

##### color ~^(required)^~
_[Table][api.type.Table]._ As an alternative to passing `r`, `g`, `b`, and `a` component values, you may pass color components in a Lua array as noted in the example below.


## Gotchas

* Passing `nil` instead of a component value will keep that component unchanged.
* Colors should have premultiplied alpha.


## Examples

##### Individual Components

``````lua
texture:setPixel( 10, 10, 1, 0, 0, 1 )
``````

##### Lua Array

``````lua
texture:setPixel( 10, 10, {1,0,0,1} )
``````
