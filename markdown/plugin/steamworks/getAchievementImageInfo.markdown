# steamworks.getAchievementImageInfo()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [ImageInfo][plugin.steamworks.type.ImageInfo]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, getAchievementImageInfo
> __See also__          [steamworks.newImageRect()][plugin.steamworks.newImageRect]
>                       [steamworks.newTexture()][plugin.steamworks.newTexture]
>						[steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns an [ImageInfo][plugin.steamworks.type.ImageInfo] object. This provides information about one achievement image such as its pixel width, pixel height, and unique image handle. This object's [imageHandle][plugin.steamworks.type.ImageInfo.imageHandle] property is needed to load the image via the [steamworks.newImageRect()][plugin.steamworks.newImageRect] and [steamworks.newTexture()][plugin.steamworks.newTexture] functions.

The returned [ImageInfo][plugin.steamworks.type.ImageInfo] object will always reference an image matching the achievement's current locked or unlocked state. For example, if the achievement is currently locked, then the returned [ImageInfo][plugin.steamworks.type.ImageInfo] object will reference the locked achievement image. If the achievement is unlocked, then the returned [ImageInfo][plugin.steamworks.type.ImageInfo] object will referenced the unlocked achievement image.


## Gotchas

This function will typically return `nil` in the following case:

* The first time it's called upon application startup; however the Steam client will then cache the requested achievement image and make it immediately available upon subsequent application launches until the Steam client has been exited. That is, exiting the Steam client will clear its cached images, forcing it to <nobr>re-download</nobr> images when restarted. 

Additionally, this function will __always__ return `nil` in these cases:

* An invalid achievement name was specified.

* The [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn] property is `false`, indicating that the application is not currently connected to the Steam client.

* The image has not yet been downloaded from Steam. In this case, an [achievementImageUpdate][plugin.steamworks.event.achievementImageUpdate] event will be dispatched once downloaded.


## Syntax

	steamworks.getAchievementImageInfo( achievementName )

##### achievementName ~^(required)^~
_[String][api.type.String]._ On the Steamworks website, this is the unique name of the achievement set under the <nobr>__API Name Progress Stat__</nobr> column.


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Creates a new display object which will automatically be "filled" with an achievement image
-- Image will be associated with the given unique achievement name
-- Image will automatically change when achievement changes from locked to unlocked
local function newSteamAchievementImage( achievementName )

	-- Create a rectangle which we'll later fill with the achievement image
	-- Note that Steam expects you to upload 64x64 pixel achievement images
	local defaultAchievementPixelSize = 64
	local achievementImage = display.newRect(
			display.contentCenterX, display.contentCenterY,
			defaultAchievementPixelSize * display.contentScaleX,
			defaultAchievementPixelSize * display.contentScaleY )
	if ( achievementImage == nil ) then
		return nil
	end

	-- Updates the achievement display object's "fill" to show the newest image
	local function updateAchievementTexture()
		-- Attempt to fetch info about the achievement's image
		-- Note that this function is likely to return nil on app startup
		local imageInfo = steamworks.getAchievementImageInfo( achievementName )
		if ( imageInfo == nil ) then
			return
		end

		-- Load the achievement image into a new texture resource object
		local newTexture = steamworks.newTexture( imageInfo.imageHandle )
		if ( newTexture == nil ) then
			return
		end

		-- Update the display object to show the achievement image
		achievementImage.fill =
		{
			type = "image",
			filename = newTexture.filename,
			baseDir = newTexture.baseDir
		}

		-- Release the texture reference created above
		newTexture:releaseSelf()
	end

	-- Attempt to update the display object with Steam's current image, if available
	-- If not currently available, this function call will trigger Steam to download it
	-- In this case, it dispatches an "achievementImageUpdate" event to be received below
	updateAchievementTexture()

	-- Set up a listener to be called when an achievement's image/status has changed
	local function onAchievementUpdated( event )
		if ( event.achievementName == achievementName ) then
			updateAchievementTexture()
		end
	end
	steamworks.addEventListener( "achievementImageUpdate", onAchievementUpdated )
	steamworks.addEventListener( "achievementInfoUpdate", onAchievementUpdated )

	-- Set up a listener to be called when the achievement display object is being removed
	local function onFinalizing( event )
		-- Remove event listeners which were added above
		steamworks.removeEventListener( "achievementImageUpdate", onAchievementUpdated )
		steamworks.removeEventListener( "achievementInfoUpdate", onAchievementUpdated )
	end
	achievementImage:addEventListener( "finalize", onFinalizing )

	-- Return the achievement display object created above
	return achievementImage
end

-- Lock all achievements and reset all user stats on startup
-- Note that this is for testing purposes (don't do this in a published game!)
steamworks.resetUserProgress()

-- Display image of "Achievement 1"
local achievement1 = newSteamAchievementImage( "Achievement 1" )
if ( achievement1 ) then
	achievement1.x = display.contentWidth * 0.25
	achievement1.y = display.contentCenterY
	-- Add functionality to unlock achievement upon click
	function achievement1:tap( event )
		steamworks.setAchievementUnlocked( "Achievement 1" )
	end
	achievement1:addEventListener( "tap" )
end

-- Display image of "Achievement 2"
local achievement2 = newSteamAchievementImage( "Achievement 2" )
if ( achievement2 ) then
	achievement2.x = display.contentWidth * 0.75
	achievement2.y = display.contentCenterY
	-- Add functionality to unlock achievement upon click
	function achievement2:tap( event )
		steamworks.setAchievementUnlocked( "Achievement 2" )
	end
	achievement2:addEventListener( "tap" )
end
``````
