# texture.baseDir

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Directory Constant][api.type.Constant]
> __Object__            [TextureResource][api.type.TextureResource]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __See also__          [texture.filename][api.type.TextureResource.filename]
>                       [texture.type][api.type.TextureResource.type]
>                       [TextureResource][api.type.TextureResource]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Use this property instead of the real directory constant to create display objects, fills, and use in other places where a real directory constant is expected. In these instances, you must also pass [texture.filename][api.type.TextureResource.filename] as a parameter &mdash; see the examples below for reference.


## Gotchas

This <nobr>texture-related</nobr> property should not be used to reference the same directory constant in <nobr>non-texture-related</nobr> methods. Essentially, this property refers to internal memory, not the file system.


## Examples

##### Image

``````lua
-- Standard image
local image1 = display.newImageRect( "background.png", 100, 100 )
image1.x = 100
image1.y = 100

-- TextureResource-based image
local texture = graphics.newTexture( { type="image", filename="background.png" } )
local image2 = display.newImageRect(
	texture.filename,  -- "filename" property required
	texture.baseDir,   -- "baseDir" property required
	100,
	100
)
image2.x = 200
image2.y = 100
``````

##### Image Fill

``````lua
-- Standard fill
local circle1 = display.newCircle( 100, 100, 50 )
circle1.fill = {
	type = "image",
	filename = "background.png"
}

-- TextureResource-based fill
local texture = graphics.newTexture( { type="image", filename="background.png" } )
local circle2 = display.newCircle( 200, 100, 50 )
circle2.fill = {
	type = "image",
	filename = texture.filename,  -- "filename" property required
	baseDir = texture.baseDir     -- "baseDir" property required
}
``````
