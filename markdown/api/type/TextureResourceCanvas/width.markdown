# texture.width

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [TextureResourceCanvas][api.type.TextureResourceCanvas]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResource][api.type.TextureResource]
>						[TextureResourceCanvas][api.type.TextureResourceCanvas]
>						[texture.height][api.type.TextureResourceCanvas.height]
>						[texture.pixelWidth][api.type.TextureResourceCanvas.pixelWidth]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This read-only property indicates the width in which objects can be rendered within a [TextureResourceCanvas][api.type.TextureResourceCanvas]. Essentially, if a display object drawn to the canvas is equal to this width, it will occupy the entire horizontal space.

Unlike [pixelWidth][api.type.TextureResourceCanvas.pixelWidth], this property is not <nobr>read-only</nobr>. The visual effect of changing it will be horizontal stretching or shrinking of rendered [TextureResourceCanvas][api.type.TextureResourceCanvas] content. To see the changes, call [texture:invalidate()][api.type.TextureResourceCanvas.invalidate].

## Gotchas

The default center of the canvas is `0`, so the coordinates of the left and right edges will be `-texture.width/2` and `texture.width/2` respectively. This can be altered by changing [texture.anchorX][api.type.TextureResourceCanvas.anchorX].
