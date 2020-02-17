# TextureResourceCanvas

> --------------------- ------------------------------------------------------------------------------------------
> __Parent__            [TextureResource][api.type.TextureResource]
> __Library__           [graphics.*][api.library.graphics]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          textures, performance optimization, texture memory, images
> __See also__         	[graphics.newTexture()][api.library.graphics.newTexture]
>						[TextureResource][api.type.TextureResource]
>						[TextureResourceBitmap][api.type.TextureResourceBitmap]
>						[texture.type][api.type.TextureResource.type]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The object created by [graphics.newTexture()][api.library.graphics.newTexture] when the specified [type][api.type.TextureResource.type] is `"canvas"`. This texture resource is an <nobr>in-memory</nobr> texture which can be modified by rendering display objects to it. It is similar to a [framebuffer object](http://en.wikipedia.org/wiki/Framebuffer_Object) or a [render target texture](https://en.wikipedia.org/wiki/Render_Target).


## Properties

#### [texture.width][api.type.TextureResourceCanvas.width]

#### [texture.height][api.type.TextureResourceCanvas.height]

#### [texture.pixelWidth][api.type.TextureResourceCanvas.pixelWidth]

#### [texture.pixelHeight][api.type.TextureResourceCanvas.pixelHeight]

#### [texture.anchorX][api.type.TextureResourceCanvas.anchorX]

#### [texture.anchorY][api.type.TextureResourceCanvas.anchorY]

#### [texture.cache][api.type.TextureResourceCanvas.cache]


## Methods

#### [texture:draw()][api.type.TextureResourceCanvas.draw]

#### [texture:invalidate()][api.type.TextureResourceCanvas.invalidate]

#### [texture:setBackground()][api.type.TextureResourceCanvas.setBackground]


## Gotchas

* All objects of this type are subject to manual texture management. In order to free them from memory, you must [release][api.type.TextureResource.releaseSelf] them when they are no longer required.

* On Android, textures are released when the application is suspended. This causes them to be cleared and they will become invalid when the application is resumed. You can restore the contents of a texture by using `texture:invalidate( "cache" )` \([documentation][api.type.TextureResourceCanvas.invalidate]\) assuming the cache was not manipulated manually.


## Example

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

-- Set background color to be applied if texture is cleared
tex:setBackground( 0, 0, 1 )

-- Create a circle and draw/render it to the texture
local circ = display.newCircle( 0, 0, 64 )
circ:setFillColor( { type="gradient", color1={0,0.2,1}, color2={0.8,0.8,0.8}, direction="down" } )
tex:draw( circ )

-- Create a polygon and draw/render it to the texture
local poly = display.newPolygon( 0, 0, {0,-55,14,-18,52,-18,22,8,32,45,0,22,-32,45,-22,8,-52,-18,-14,-18} )
poly:setFillColor( 0.2, 1, 0.2 )
tex:draw( poly )

-- Schedule texture objects to be rendered to texture before next frame
tex:invalidate()

-- Function to restore texture on resume
local function onSystemEvent( event )
	if ( event.type == "applicationResume" ) then
		tex:invalidate( "cache" )
	end
end

-- Set up a system event listener
Runtime:addEventListener( "system", onSystemEvent )
``````
