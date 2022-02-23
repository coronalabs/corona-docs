# steamworks.newTexture()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [TextureResourceExternal][api.type.TextureResourceExternal]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, newTexture
> __See also__          [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo]
>                       [steamworks.getUserImageInfo()][plugin.steamworks.getUserImageInfo]
>                       [steamworks.newImageRect()][plugin.steamworks.newImageRect]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Loads a Steam image to a [texture][api.type.TextureResourceExternal] by its unique [imageHandle][plugin.steamworks.type.ImageInfo.imageHandle] that was retrieved by the [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo] or [steamworks.getUserImageInfo()][plugin.steamworks.getUserImageInfo] functions.

The returned [texture][api.type.TextureResourceExternal] can be shown by the [display.newImage()][api.library.display.newImage] and [display.newImageRect()][api.library.display.newImageRect] functions. The [texture][api.type.TextureResourceExternal] can also be applied to an existing [ShapeObject][api.type.ShapeObject] via its [fill][api.type.ShapeObject.fill] property.


## Gotchas

This function will return `nil` in the following cases:

* Invalid arguments were specified.
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.


## Syntax

	steamworks.newTexture( imageHandle )

##### imageHandle ~^(required)^~
_[Number][api.type.Number]._ Unique identifier of the Steam image to load as a texture. This identifier is provided by an [ImageInfo][plugin.steamworks.type.ImageInfo] object's [imageHandle][plugin.steamworks.type.ImageInfo.imageHandle] property.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Create a rectangle which we'll later fill with the avatar image
local defaultAvatarWidth = 184 * display.contentScaleX
local defaultAvatarHeight = 184 * display.contentScaleY
local avatarImage = display.newRect(
	display.contentCenterX, display.contentCenterY,
	defaultAvatarWidth, defaultAvatarHeight )

-- Updates the above display object's "fill" to show the newest large avatar image
local function updateAvatar()
	-- Attempt to fetch info about the user's large avatar image
	local imageInfo = steamworks.getUserImageInfo( "largeAvatar" )
	if ( imageInfo == nil ) then
		return
	end

	-- Load the avatar image into a new texture resource object
	local newTexture = steamworks.newTexture( imageInfo.imageHandle )
	if ( newTexture == nil ) then
		return
	end
	
	-- Update the display object to show the avatar image
	avatarImage.fill =
	{
		type = "image",
		filename = newTexture.filename,
		baseDir = newTexture.baseDir
	}

	-- Release the texture reference
	newTexture:releaseSelf()
end


-- Attempt to update the display object with Steam's current image, if available
-- If not currently available, this function call will trigger Steam to download it
-- In this case, it dispatches a "userInfoUpdate" event to be received below
updateAvatar()

-- Set up a listener to be called when a user's info has changed
local function onUserInfoUpdated( event )
	-- Update display object only when the current user's avatar changes
	if ( steamworks.userSteamId == event.userSteamId ) then
		if ( event.largeAvatarChanged ) then
			updateAvatar()
		end
	end
end
steamworks.addEventListener( "userInfoUpdate", onUserInfoUpdated )
``````
