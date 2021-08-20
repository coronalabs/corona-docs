
# graphics.newTexture()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [graphics.*][api.library.Graphics]
> __Return value__      [TextureResource][api.type.TextureResource]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          textures, performance optimization, texture memory, images
> __See also__          [graphics.releaseTextures()][api.library.graphics.releaseTextures]
>						[texture:releaseSelf()][api.type.TextureResource.releaseSelf]
>						[Texture Loading/Management][guide.graphics.textureManagement] _(guide)_
>						[TextureResource][api.type.TextureResource]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Creates a [TextureResource][api.type.TextureResource] object which allows you to access and manage textures. This can be used to <nobr>pre-load</nobr> a texture/image and prevent it from being disposed when there is no display object using it.

After the [TextureResource][api.type.TextureResource] object is created, you can use it in <nobr>texture-related</nobr> instances by specifying the [filename][api.type.TextureResource.filename] and [baseDir][api.type.TextureResource.baseDir] properties.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

There are several important nuances you should understand before using [TextureResource][api.type.TextureResource] objects — see the next section for details.

</div>


## Gotchas

* [TextureResource][api.type.TextureResource] objects created with `graphics.newTexture()` will __not__ be automatically disposed/released, even if there are no display objects using the texture. This can lead to memory leaks, so you should handle this task manually. Individually, texture resource objects can be disposed/released via [texture:releaseSelf()][api.type.TextureResource.releaseSelf], or in a wider scope, [graphics.releaseTextures()][api.library.graphics.releaseTextures] can be used to release all texture objects sharing the same [type][api.type.TextureResource.type] property.

* [TextureResource][api.type.TextureResource] objects have [filename][api.type.TextureResource.filename] and [baseDir][api.type.TextureResource.baseDir] properties which can be used to refer to the underlying texture. These <nobr>texture-related</nobr> properties should not be used to reference the same file or directory constant in <nobr>non-texture-related</nobr> methods &mdash; for example, if you specify `"background.png"` as the `filename` for the texture, do not attempt to use `texture.filename` as a reference to the same file in [system.pathForFile()][api.library.system.pathForFile]. Essentially, these properties refer to internal memory, not the file system.

* If you don't need to maintain reference to a [TextureResource][api.type.TextureResource] object, it is recommended that you dispose/release it. If any display objects are currently using the released texture, they will not be corrupted &mdash; instead, they will hold on to the texture under the hood, and if/when they are removed, the texture will be automatically disposed.

* Calling `graphics.newTexture()` multiple times with reference to the same file will __not__ create unique [TextureResource][api.type.TextureResource] objects. Thus, if you call [texture:releaseSelf()][api.type.TextureResource.releaseSelf] on any texture resource object, it will be disposed/removed from memory, and all other pointers to `graphics.newTexture()` which used the same file will become `nil`.


## Syntax

	graphics.newTexture( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing the required parameters for the [TextureResource][api.type.TextureResource] object — see the next section for details.


## Parameter Reference

##### type ~^(required)^~

_[String][api.type.String]._ The [type][api.type.TextureResource.type] of the texture to be created. Depending on this value, other <nobr>key-value</nobr> parameters will be taken into account (inspect&nbsp;carefully&nbsp;below).

* `"image"` &mdash; Creates a [TextureResource][api.type.TextureResource] object of type [TextureResourceBitmap][api.type.TextureResourceBitmap]. Objects of this type are used to <nobr>pre-load</nobr> and cache textures based on real images within the project's file system.

<div class="code-indent">

``````lua
local imageTexture = graphics.newTexture( { type="image", filename="icon.png", baseDir=system.ResourceDirectory } )
``````

</div>

* `"canvas"` &mdash; Creates a [TextureResource][api.type.TextureResource] object of type [TextureResourceCanvas][api.type.TextureResourceCanvas]. This texture resource is an <nobr>in-memory</nobr> texture which can be modified by rendering display objects to it.

<div class="code-indent">

``````lua
local canvasTexture = graphics.newTexture( { type="canvas", width=128, height=128 } )
``````

</div>

* `"maskCanvas"` &mdash; Creates a [TextureResource][api.type.TextureResource] object of type [TextureResourceCanvas][api.type.TextureResourceCanvas]. This texture resource is an <nobr>in-memory</nobr> texture which can be modified by rendering display objects to it.

    This type is intended specifically for masks. In particular, a canvas will be the image provided to [graphics.newMask][api.library.graphics.newMask], so its dimensions must honor the same constraints.
    
    When an object is drawn to the canvas, its "red" results are used and the remaining components are ignored. A red value of 0 produces a black pixel and a value of 1 a white pixel. Intermediate values lead to the corresponding shades of gray.

    (**GOTCHA**: This is only confirmed to work on Windows and Android. Other platforms might still need minor fixes.)

<div class="code-indent">

``````lua
local maskCanvasTexture = graphics.newTexture( { type="maskCanvas", width=128, height=128 } )
``````

</div>



##### filename ~^(required)^~
_[String][api.type.String]._ Only applies when `type` is `"image"`. Indicates the name of the image file to load, relative to `baseDir` (`system.ResourceDirectory` by default).

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ Only applies when `type` is `"image"`. Specifies the base directory where `filename` is located. Options include `system.ResourceDirectory`, `system.DocumentsDirectory`, `system.ApplicationSupportDirectory`, `system.TemporaryDirectory` and `system.CachesDirectory`. Default is `system.ResourceDirectory`.

##### width ~^(required)^~
_[Number][api.type.Number]._ Only applies when `type` is `"canvas"` or `"maskCanvas"`. Specifies the width in which objects can be rendered within a [TextureResourceCanvas][api.type.TextureResourceCanvas].

##### height ~^(required)^~
_[Number][api.type.Number]._ Only applies when `type` is `"canvas" or `"maskCanvas"``. Specifies the height in which objects can be rendered within a [TextureResourceCanvas][api.type.TextureResourceCanvas].

##### pixelWidth ~^(optional)^~
_[Number][api.type.Number]._ Only applies when `type` is `"canvas"` or `"maskCanvas"`. Specifies the horizontal pixel dimensions of the texture that the canvas resource is rendered to.

##### pixelHeight ~^(optional)^~
_[Number][api.type.Number]._ Only applies when `type` is `"canvas"` or `"maskCanvas"`. Specifies the vertical pixel dimensions of the texture that the canvas resource is rendered to.


## Examples

##### Pre-loading Images

`````lua
-- Create "TextureResource" object of type "TextureResourceBitmap"
local backgroundTexture = graphics.newTexture( { type="image", filename="background.png" } )

-- Create display object with the pre-loaded texture
local background = display.newImageRect(
	backgroundTexture.filename,  -- "filename" property required
	backgroundTexture.baseDir,   -- "baseDir" property required
	display.contentWidth,
	display.contentHeight
)
background.x = display.contentCenterX
background.y = display.contentCenterY

-- If you no longer need the texture, release it to prevent memory leaks
backgroundTexture:releaseSelf()

-- Alternatively, release all texture objects of a specific type
graphics.releaseTextures( { type="image" } )
`````

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
##### Render to Mask Canvas Resource

``````lua
local tex = graphics.newTexture{ type = "canvas", width = 128, height = 128 }
local back = display.newRect(0, 0, 128, 128)

back:setFillColor(1, 0, 0)

local rect = display.newRect(0, 0, 32, 64)

rect:setFillColor(0, 0, 1)

tex:draw(back)
tex:draw(rect)
tex:invalidate()

-- Create a renderable mask and draw an all-white rect into it.
local mask = graphics.newTexture{ type = "maskCanvas", width = 512, height = 512 }
local mask_back = display.newRect(0, 0, 512 - 6, 512 - 6)

mask:draw(mask_back)

-- Add some circles in their initial locations. We'll make these black and
-- periodically draw them into the mask, above the white rect.
local circles = {}

for i = 1, 10 do
    circles[i] = display.newCircle(0, 0, math.random(10, 35))

    circles[i]:setFillColor(0)

    circles[i].radius = math.random(i * 10, 170)
    circles[i].speed = math.random(1, 7) * .05

    mask:draw(circles[i])
end

-- Add a background beneath the masked parts.
local background = display.newRect(250, 250, mask.width, mask.height)

background.fill = { type = "image", filename = tex.filename, baseDir = tex.baseDir }

background:setStrokeColor(0, 0, 1)

background.alpha = .7
background.strokeWidth = 3

-- These three rects will be affected by the mask.
local masked_group = display.newGroup()

local r1 = display.newRect(masked_group, 250, 350, 150, 200)
local r2 = display.newRect(masked_group, 450, 100, 200, 100)
local r3 = display.newRect(masked_group, 150, 150, 100, 200)

masked_group:setMask(graphics.newMask(mask.filename, mask.baseDir))

masked_group.maskX, masked_group.maskY = background.x, background.y

local x0 = background.x

-- Move the background back and forth...
timer.performWithDelay(50, function(event)
    background.x = x0 + math.sin(event.time / 800) * 50
end, 0)

-- ...and update the circle arcs along with it.
timer.performWithDelay(150, function(event)
    for i, circ in ipairs(circles) do
        local angle = (event.time * circ.speed) * .0035

        circ.x, circ.y = math.cos(angle) * circ.radius, math.sin(angle) * circ.radius
    end

    mask:invalidate("cache")
end, 0)
``````
