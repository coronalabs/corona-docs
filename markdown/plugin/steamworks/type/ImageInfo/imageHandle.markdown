# object.imageHandle

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, image, texture, avatar, ImageInfo, imageHandle
> __See also__          [ImageInfo][plugin.steamworks.type.ImageInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The unique temporary integer identifier that is assigned to the image by Steam. This is used to load the image via the [steamworks.newImageRect()][plugin.steamworks.newImageRect] or [steamworks.newTexture()][plugin.steamworks.newTexture] functions.


## Gotchas

Image handles should never be saved to file. The unique handle assigned to an image by Steam will likely change after subsequent launches of the application.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Fetch information about the logged in user's avatar image
local imageInfo = steamworks.getUserImageInfo( "mediumAvatar" )
if ( imageInfo == nil ) then
	return
end

-- Use "steamworks.newImageRect()" to display avatar on left side of the screen
local imageAvatar = steamworks.newImageRect( imageInfo.imageHandle, 64, 64 )
if ( imageAvatar ) then
	imageAvatar.x = display.contentWidth * 0.25
	imageAvatar.y = display.contentCenterY
end

-- Use "steamworks.newTexture()" to display avatar on right side of the screen
local texture = steamworks.newTexture( imageInfo.imageHandle )
if ( texture ) then
	local textureAvatar = display.newRect( display.contentWidth*0.75, display.contentCenterY, 64, 64 )
	rectangle.fill =
	{
		type = "image",
		filename = texture.filename,
		baseDir = texture.baseDir
	}
	texture:releaseSelf()
end
``````
