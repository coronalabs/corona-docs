# MemoryBitmap:getPixel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Numbers][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          MemoryBitmap, getPixel
> __See also__          [MemoryBitmap][plugin.memoryBitmap.type.MemoryBitmap]
>						[MemoryBitmap:setPixel()][plugin.memoryBitmap.type.MemoryBitmap.setPixel]
>						[memoryBitmap.newTexture()][plugin.memoryBitmap.newTexture]
>						[memoryBitmap.*][plugin.memoryBitmap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns color components of a specified pixel in the range of `0` to `1` for each component.


## Syntax

	local r, g, b, a = bitmap:getPixel( x, y )
   
##### x, y ~^(required)^~
_[Numbers][api.type.Number]._ The __x__ and __y__ pixel coordinates to be fetched.
