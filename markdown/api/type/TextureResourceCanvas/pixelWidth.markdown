# texture.pixelWidth

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Object__            [TextureResourceCanvas][api.type.TextureResourceCanvas]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResource][api.type.TextureResource]
>                       [TextureResourceCanvas][api.type.TextureResourceCanvas]
>						[texture.pixelHeight][api.type.TextureResourceCanvas.pixelHeight]
>						[texture.width][api.type.TextureResourceCanvas.width]
>						[display.setDefault()][api.library.display.setDefault]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This read-only property indicates the horizontal pixel dimensions of the texture that the canvas resource is rendered to.

Creating textures with low `pixelWidth` and `pixelHeight` like `32` or `64` can create nice pixelated effects. To make pixel edges sharp, use <nobr>`display.setDefault( "magTextureFilter", "nearest" )`</nobr> before creating the texture.
