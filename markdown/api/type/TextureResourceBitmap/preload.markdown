# texture:preload()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Object__            [TextureResourceBitmap][api.type.TextureResourceBitmap]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [TextureResource][api.type.TextureResource]
>                       [TextureResourceBitmap][api.type.TextureResourceBitmap]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When an image texture is created, the bitmap is read from the file system and loaded into memory. At the first point a display object is created which utilizes the texture, it is scheduled to load to the GPU.

Use this method to schedule loading of the texture to the GPU before the start of the next time step. This may reduce the time required to render the display object which utilizes the texture.


## Example

``````lua
-- Create "TextureResource" object of type "TextureResourceBitmap"
local texture = graphics.newTexture( { type="image", filename="background.png" } )

-- Pre-load the texture to the GPU
texture:preload()

-- Create display object with the pre-loaded texture
local background = display.newImageRect(
	texture.filename,  -- "filename" property required
	texture.baseDir,   -- "baseDir" property required
	display.contentWidth,
	display.contentHeight
)

-- If you no longer need the texture, release it to prevent memory leaks
texture:releaseSelf()
``````
