# texture.cache

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [GroupObject][api.type.GroupObject]
> __Object__            [TextureResourceCanvas][api.type.TextureResourceCanvas]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResource][api.type.TextureResource]
>						[TextureResourceCanvas][api.type.TextureResourceCanvas]
>                       [texture.invalidate()][api.type.TextureResourceCanvas.invalidate]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

After being rendered to the [TextureResourceCanvas][api.type.TextureResourceCanvas], the associated [display object][api.type.DisplayObject] is moved to this group.

All objects within this group are rendered when the canvas is invalidated with `"cache"`:

``````lua
texture:invalidate( "cache" )
``````

Elements in this [GroupObject][api.type.GroupObject] can be accessed just like elements in any other display group. You can manually add or remove child objects and use [texture:invalidate()][api.type.TextureResourceCanvas.invalidate] to render changes to the texture.

## Gotchas

Modifying geometry properties like anchors can be very tricky for this group and doing so may lead to undesired behavior when used in combination with [texture.draw()][api.type.TextureResourceCanvas.draw] and cumulative invalidation.
