# texture:releaseSelf()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextureResource][api.type.TextureResource]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [graphics.releaseTextures()][api.library.graphics.releaseTextures]
>						[TextureResource][api.type.TextureResource]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The [graphics.newTexture()][api.library.graphics.newTexture] API <nobr>pre-loads</nobr> a texture/image and prevents it from being disposed even when there is no display object using it. In order to release the [TextureResource][api.type.TextureResource] object and restore automatic management for the texture, you must release it by calling `texture:releaseSelf()`.

Alternatively, in a wider scope, [graphics.releaseTextures()][api.library.graphics.releaseTextures] can be used to release all texture objects sharing the same [type][api.type.TextureResource.type] parameter.


## Gotchas

After `texture:releaseSelf()` is called, only the `texture` handle is released and becomes invalid. All display objects which are using the [TextureResource][api.type.TextureResource] will hold on to their handles. The [TextureResource][api.type.TextureResource] itself will only be disposed after there are no display objects using it.


## Example

``````lua
local texture = graphics.newTexture( { type="image", filename="background.png" } )

-- If you no longer need the texture, release it to prevent memory leaks
texture:releaseSelf()
``````
