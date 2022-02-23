# achievementImageUpdate

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, achievementImageUpdate
> __See also__          [steamworks.addEventListener()][plugin.steamworks.addEventListener]
>                       [steamworks.*][plugin.steamworks]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event occurs when an achievement image has been loaded for the first time, or when the image has changed.

You can receive these events by adding a [listener][api.type.Listener] to the plugin via the [steamworks.addEventListener()][plugin.steamworks.addEventListener] function.


## Gotchas

* If you call the [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo] function and it returns `nil`, Steam will automatically fetch the achievement image asynchronously&nbsp;&mdash; assuming that it was given a valid achievement&nbsp;name&nbsp;&mdash; and dispatch this event.

* The [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo] function will typically return `nil` the first time it is called upon application startup, but the Steam client will then cache the requested achievement image and make it immediately available upon subsequent application launches until the Steam client has been exited. That is, exiting the Steam client will clear its cached images, forcing it to <nobr>re-download</nobr> images when restarted.


## Properties

#### [event.achievementName][plugin.steamworks.event.achievementImageUpdate.achievementName]

#### [event.imageInfo][plugin.steamworks.event.achievementImageUpdate.imageInfo]

#### [event.name][plugin.steamworks.event.achievementImageUpdate.name]

#### [event.unlocked][plugin.steamworks.event.achievementImageUpdate.unlocked]


## Example

``````lua
local steamworks = require( "plugin.steamworks" )

-- Called when an achievement image has been changed/loaded
local function onAchievementImageUpdated( event )
	-- Fetch information about the achievement
	local achievementInfo = steamworks.getAchievementInfo( event.achievementName )

	-- Print the achievement's image info to the log
	print( "Achievement Image Updated" )
	print( "  Localized Name: " .. achievementInfo.localizedName )
	print( "  Is Unlocked Image: " .. tostring(event.unlocked) )
	print( "  Image Pixel Width: " .. tostring(event.imageInfo.pixelWidth) )
	print( "  Image Pixel Height: " .. tostring(event.imageInfo.pixelHeight) )
end

-- Set up a listener to be invoked when an achievement image has been changed/loaded
steamworks.addEventListener( "achievementImageUpdate", onAchievementImageUpdated )
``````
