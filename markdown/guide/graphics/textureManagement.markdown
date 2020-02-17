# Texture Loading/Management

This guide discusses [TextureResource][api.type.TextureResource] objects which provide a handle to manually manage and access information about textures.

<div class="guides-toc">

* [Overview](#overview)
* [Creation and Usage](#usage)
* [Examples](#examples)

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Note</div>

The methods outlined in this guide are intended for <nobr>finer-grained</nobr> control of managing textures in very specific situations. For general app development, these will not be necessary, but we provide them for more advanced purposes.

</div>




<a id="overview"></a>

## Overview

[TextureResource][api.type.TextureResource] objects give you control over the lifetime of textures in memory while also providing abstraction over file names and directories. The primary purpose of these objects is to <nobr>pre-load</nobr> textures into memory so that creating display objects using them will be virtually instantaneous.

Essentially, when you create a [TextureResource][api.type.TextureResource] object with [graphics.newTexture()][api.library.graphics.newTexture], a reference to the texture is retained in memory &mdash; this is similar to the reference that display objects hold if they utilize a texture. The key difference is that a texture which is __not__ loaded as a [TextureResource][api.type.TextureResource] object will be disposed/released when there are no display objects using the texture, while a texture loaded as a [TextureResource][api.type.TextureResource] object will remain in memory until you explicitly release it via [object:releaseSelf()][api.type.TextureResource.releaseSelf] or [graphics.releaseTextures()][api.library.graphics.releaseTextures].




<a id="usage"></a>

## Creation and Usage

### Creating

[TextureResource][api.type.TextureResource] objects are easily created using the [graphics.newTexture()][api.library.graphics.newTexture] method. The sole argument is a table containing the required parameters for the [TextureResource][api.type.TextureResource] object. For&nbsp;example:

``````lua
local texture = graphics.newTexture( { type="image", filename="background.png" } )
``````

``````lua
local texture = graphics.newTexture( { type="canvas", width=128, height=128 } )
``````

This code will create the texture resource object under the variable handle `texture`. Once created, you can utilize the underlying texture with various properties and methods associated with the [TextureResource][api.type.TextureResource] itself.

### Using/Accessing

From the [TextureResource][api.type.TextureResource] object, the [filename][api.type.TextureResource.filename] and [baseDir][api.type.TextureResource.baseDir] properties let you create images, image&nbsp;sheets, custom fills/strokes, and other objects which accept a file name and directory constant. For instance:

``````lua
-- TextureResource-based image
local background = display.newImageRect(
	texture.filename,  -- "filename" property required
	texture.baseDir,   -- "baseDir" property required
	display.contentWidth,
	display.contentHeight
)

-- TextureResource-based fill
local circle = display.newCircle( 200, 100, 50 )
circle.fill = {
	type = "image",
	filename = texture.filename,  -- "filename" property required
	baseDir = texture.baseDir     -- "baseDir" property required
}
``````

Note that these <nobr>texture-related</nobr> properties should not be used to reference the same file or directory constant in <nobr>non-texture-related</nobr> methods &mdash; for example, if you specify `"background.png"` as the `filename` for the texture, do not attempt to use `texture.filename` as a reference to the same file in [system.pathForFile()][api.library.system.pathForFile]. Essentially, these properties refer to internal memory, not the file system.

### Managing Lifetime

To prevent memory leaks, it's important to dispose/release [TextureResource][api.type.TextureResource] objects if they are no longer required. This can be done either on an individual basis or in a wider scope:

* Release an individual texture resource object by calling [texture:releaseSelf()][api.type.TextureResource.releaseSelf] on the handle:

<div class="code-indent">

``````lua
texture:releaseSelf()
``````

</div>

* Release all texture resource objects sharing the same [type][api.type.TextureResource.type] property by calling [graphics.releaseTextures()][api.library.graphics.releaseTextures]:

<div class="code-indent">

``````lua
graphics.releaseTextures( { type="image" } )
graphics.releaseTextures( { type="canvas" } )
``````

</div>

Note that if any display objects are currently using the released texture, they will not be corrupted &mdash; instead, they will hold on to the texture under the hood, and if/when they are removed, the texture will be automatically disposed.

### Texture Types

Calling [graphics.newTexture()][api.library.graphics.newTexture] actually produces objects of different types, depending on the specified `type` parameter. All types contain the shared properties/methods of [TextureResource][api.type.TextureResource]  plus additional properties/methods depending on the type:

* [TextureResourceBitmap][api.type.TextureResourceBitmap] &mdash; The texture resource object created by `type="image"`.
* [TextureResourceCanvas][api.type.TextureResourceCanvas] &mdash; The texture resource object created by `type="canvas"`.




<a id="examples"></a>

## Examples

##### Pre-loading Images

``````lua
-- This simplified example pre-loads textures into memory

-- These files are high-resolution images which may affect performance if loaded normally
local filenames = {
	"splat1.png",
	"splat2.png",
	"splat3.png",
	"splat4.png",
	"splat5.png"
}

-- Pre-load textures to memory
local textures = {}
for i = 1,#filenames do
	textures[i] = graphics.newTexture(
		{
			type = "image",
			filename = filenames[i],
			baseDir = system.ResourceDirectory
		})
	textures[i]:preload()
end

-- Sometime later, display the images
-- Because the images were pre-loaded, no performance impact will occur
local objects = {}
for i = 1,#textures do
	local texture = textures[i]
	objects[i] = display.newImageRect( texture.filename, texture.baseDir, 100, 100 )
end

-- If the textures are no longer needed, release them to prevent memory leaks
for i = 1,#textures do
	textures[i]:releaseSelf()
end
textures = {}
``````

##### Render to Canvas Resource

``````lua
local tex = graphics.newTexture( { type="canvas", width=128, height=128 } )

-- Create display object with texture as contents
local rect = display.newImageRect(
	tex.filename,  -- "filename" property required
	tex.baseDir,   -- "baseDir" property required
	display.contentWidth,
	display.contentHeight
)
rect.x = display.contentCenterX
rect.y = display.contentCenterY

-- Create a circle and draw/render it to the texture
local circ = display.newCircle( 0, 0, 64 )
circ:setFillColor( { type="gradient", color1={0,0.2,1}, color2={0.8,0.8,0.8}, direction="down" } )
tex:draw( circ )

-- Schedule texture objects to be rendered to texture before next frame
tex:invalidate()
``````

##### Advanced Management

<div style="margin-top: 4px;">

The advanced example, available on [GitHub](https://github.com/coronalabs/samples-coronasdk/tree/master/Graphics/TextureLoad), downloads images from the web and has the capability to <nobr>pre-load</nobr> and release textures on runtime for optimized performance purposes.

</div>
