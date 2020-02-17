# texture.wrapY

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextureResourceBitmap][api.type.TextureResourceBitmap]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResource][api.type.TextureResource]
>						[TextureResourceBitmap][api.type.TextureResourceBitmap]
>						[display.setDefault()][api.library.display.setDefault]
>						[texture.wrapX][api.type.TextureResourceBitmap.wrapX]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Indicates the vertical wrap mode for a texture: `"clampToEdge"`, `"repeat"` or `"mirroredRepeat"`.


## Example

``````lua
display.setDefault( "textureWrapX", "repeat" )
display.setDefault( "textureWrapY", "mirroredRepeat" )

-- Create "TextureResource" object of type "TextureResourceBitmap"
local texture = graphics.newTexture( { type="image", filename="background.png" } )

print( texture.wrapX )  --> "repeat"
print( texture.wrapY )  --> "mirroredRepeat"
``````
