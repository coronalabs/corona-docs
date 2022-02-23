# steamworks.newImageRect()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [DisplayObject][api.type.DisplayObject]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, newImageRect
> __See also__          [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo]
>                       [steamworks.getUserImageInfo()][plugin.steamworks.getUserImageInfo]
>                       [steamworks.newTexture()][plugin.steamworks.newTexture]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Displays a Steam image by its unique [imageHandle][plugin.steamworks.type.ImageInfo.imageHandle] property that was retrieved by the [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo] or [steamworks.getUserImageInfo()][plugin.steamworks.getUserImageInfo] functions.

This function works like the Corona [display.newImageRect()][api.library.display.newImageRect] function where you can specify the width and height at which the Steam image will be scaled relative to the content width and height defined in `config.lua`.


## Gotchas

This function will return `nil` in the following cases:

* Invalid arguments were specified.
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.


## Syntax

	steamworks.newImageRect( [parent,] imageHandle, width, height )

##### parent ~^(optional)^~
_[GroupObject][api.type.GroupObject]._ An optional display group in which to insert the image.

##### imageHandle ~^(required)^~
_[Number][api.type.Number]._ Unique identifier of the Steam image to load and display. This identifier is provided by an [ImageInfo][plugin.steamworks.type.ImageInfo] object's [imageHandle][plugin.steamworks.type.ImageInfo.imageHandle] property.

##### width ~^(required)^~
_[Number][api.type.Number]._ The content width at which to scale the Steam image.

##### height ~^(required)^~
_[Number][api.type.Number]._ The content height at which to scale the Steam image.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Fetch information about the currently logged in user's medium-sized avatar
local imageInfo = steamworks.getUserImageInfo( "mediumAvatar" )
if ( imageInfo == nil ) then
	return
end

-- Display the user's avatar scaled to 64x64 content coordinates on the left
local avatarImage = steamworks.newImageRect( imageInfo.imageHandle, 64, 64 )
if ( avatarImage ) then
	avatarImage.x = display.contentWidth * 0.25
	avatarImage.y = display.contentCenterY
end

-- Display the user's avatar unscaled and "pixel perfect" on the right
local avatarImage = steamworks.newImageRect(
	imageInfo.imageHandle,
	imageInfo.pixelWidth * display.contentScaleX,
	imageInfo.pixelHeight * display.contentScaleY )
if ( avatarImage ) then
	avatarImage.x = display.contentWidth * 0.75
	avatarImage.y = display.contentCenterY
end
``````
