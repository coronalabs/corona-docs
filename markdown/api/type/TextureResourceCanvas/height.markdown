# texture.height

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [TextureResourceCanvas][api.type.TextureResourceCanvas]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResource][api.type.TextureResource]
>						[TextureResourceCanvas][api.type.TextureResourceCanvas]
>						[texture.width][api.type.TextureResourceCanvas.width]
>						[texture.pixelHeight][api.type.TextureResourceCanvas.pixelHeight]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property indicates the height in which objects can be rendered within a [TextureResourceCanvas][api.type.TextureResourceCanvas]. Essentially, if a display object drawn to the canvas is equal to this height, it will occupy the entire vertical space.

Unlike [pixelHeight][api.type.TextureResourceCanvas.pixelHeight], this property is not <nobr>read-only</nobr>. The visual effect of changing it will be vertical stretching or shrinking of rendered [TextureResourceCanvas][api.type.TextureResourceCanvas] content. To see the changes, call [texture:invalidate()][api.type.TextureResourceCanvas.invalidate].

## Gotchas

The default center of the canvas is `0`, so the coordinates of the top and bottom edges will be `-texture.height/2` and `texture.height/2` respectively. This can be altered by changing [texture.anchorY][api.type.TextureResourceCanvas.anchorY].
