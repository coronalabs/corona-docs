# steamworks.getUserImageInfo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [ImageInfo][plugin.steamworks.type.ImageInfo]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, getUserImageInfo
> __See also__          [steamworks.newImageRect()][plugin.steamworks.newImageRect]
>                       [steamworks.newTexture()][plugin.steamworks.newTexture]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an [ImageInfo][plugin.steamworks.type.ImageInfo] object. This provides information about one user avatar image such as its pixel width, pixel height, and unique image handle. This object's [imageHandle][plugin.steamworks.type.ImageInfo.imageHandle] property is needed to load the image via the [steamworks.newImageRect()][plugin.steamworks.newImageRect] and [steamworks.newTexture()][plugin.steamworks.newTexture] functions.


## Gotchas

This function will typically return `nil` when attempting to fetch information about a 184&times;184 pixel `"largeAvatar"` image. This is because the Steam client does not normally cache these large images.

Additionally, this function will always return `nil` in these cases:

* Invalid arguments were specified.
* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.
* The image hasn't yet been downloaded from the Steam server. In this case, the requested image will automatically be downloaded. The result of this request will then be provided by the [userInfoUpdate][plugin.steamworks.event.userInfoUpdate] event which can be received by a listener given to the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function. This event will indicate that the image has been downloaded when either the [event.smallAvatarChanged][plugin.steamworks.event.userInfoUpdate.smallAvatarChanged], [event.mediumAvatarChanged][plugin.steamworks.event.userInfoUpdate.mediumAvatarChanged], or [event.largeAvatarChanged][plugin.steamworks.event.userInfoUpdate.largeAvatarChanged] properties are set to `true`.


## Syntax

	steamworks.getUserImageInfo( type [, userSteamId] )

##### type ~^(required)^~
_[String][api.type.String]._ Unique name of the image to fetch from the user. This must be one of the following:

<div class="inner-table">

Type				Pixel Size (w&times;h)									 
------------------	----------------------
`"smallAvatar"`		32&times;32
`"mediumAvatar"`	64&times;64
`"largeAvatar"`		184&times;184
------------------	----------------------

</div>

##### userSteamId ~^(optional)^~
_[String][api.type.String]._ Unique string ID of the user. The ID will default to the current user if this argument is not provided.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Forward-reference the last displayed avatar image
local avatarImage

-- Displays the currently logged in user's avatar image
local function displaySteamUserAvatar()
	-- Fetch information about the user's medium-sized avatar image
	local imageInfo = steamworks.getUserImageInfo( "mediumAvatar" )
	if ( imageInfo == nil ) then
		-- Image is not available yet; wait for a "userInfoUpdate" event
		return
	end

	-- Display the avatar image
	local newAvatarImage = steamworks.newImageRect( imageInfo.imageHandle, 64, 64 )
	if ( newAvatarImage == nil ) then
		return
	end
	newAvatarImage.x = display.contentCenterX
	newAvatarImage.y = display.contentCenterY

	-- Remove the last displayed avatar image, if it exists
	if ( avatarImage ) then
		avatarImage:removeSelf()
	end

	-- Store a reference to the new avatar image
	avatarImage = newAvatarImage
end

-- Attempt to show the currently logged in user's avatar image on startup
-- Note that this will likely fail on the first app launch by the Steam client
displaySteamUserAvatar()

-- Called when a Steam user's information/avatar has changed
local function onSteamUserInfoUpdated( event )
	-- Display current user's medium-sized avatar if it changed or loaded for the first time
	if ( ( event.userSteamId == steamworks.userSteamId ) and event.mediumAvatarChanged ) then
		displaySteamUserAvatar()
	end
end
steamworks.addEventListener( "userInfoUpdate", onSteamUserInfoUpdated )
``````
