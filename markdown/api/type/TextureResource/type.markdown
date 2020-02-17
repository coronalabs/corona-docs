# texture.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Object__            [TextureResource][api.type.TextureResource]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [texture.filename][api.type.TextureResource.filename]
>						[texture.baseDir][api.type.TextureResource.baseDir]
>                       [TextureResource][api.type.TextureResource]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property indicates the type of texture.


## Examples

``````lua
local texture1 = graphics.newTexture( { type="image", filename="background.png" } )
print( texture1.type )  --> "image"
``````

``````lua
local texture2 = graphics.newTexture( { type="canvas", width=128, height=128 } )
print( texture2.type )  --> "canvas"
``````
