# object.pixelWidth

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, image, texture, avatar, ImageInfo, pixelWidth
> __See also__          [ImageInfo][plugin.steamworks.type.ImageInfo]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

An integer indicating the width of the image in pixels.

You can convert this property's pixel width to Corona <nobr>content-scaled</nobr> coordinates, relative to the content width and height set in the `config.lua` file, by multiplying this property by the [display.contentScaleX][api.library.display.contentScaleX] property.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Fetch information about the logged in user's medium avatar image
local imageInfo = steamworks.getUserImageInfo( "avatarMedium" )

if ( imageInfo ) then
	-- Print the avatar size in pixels
	local message1 = string.format(
		"Medium Avatar Pixel Size: %dx%d",
		imageInfo.pixelWidth,
		imageInfo.pixelHeight )
	print( message1 )

	-- Print the avatar size in Corona's content scaled coordinates
	local message2 = string.format(
		"Medium Avatar Content Size: %dx%d",
		imageInfo.pixelWidth * display.contentScaleX,
		imageInfo.pixelHeight * display.contentScaleY )
	print( message2 )
end
``````
