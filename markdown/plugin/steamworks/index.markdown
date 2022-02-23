# steamworks.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          steam, steamworks, achievements, leaderboard
> __Platforms__         macOS, Windows
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Steamworks plugin is intended for desktop games uploaded to Steam. It is used to handle achievements, player stats, leaderboards, and to show <nobr>in-app</nobr> overlays.


## Gotchas

The Steamworks plugin can be used in the CORONA_CORE_PRODUCT Simulator, but it has the following limitations/issues:

* On Mac, Steam overlays will not appear unless CORONA_CORE_PRODUCT Simulator is launched from the Steam client and a system preference is set. See the [Overlay Troubleshooting][plugin.steamworks.guide.overlays] guide for more details.
* On Windows, overlays will not display correctly when using a device skin. You should simulate with a borderless window instead.
* You must exit the CORONA_CORE_PRODUCT Simulator application when testing with a different Steam AppID.
* Exiting the Steam client will automatically terminate the CORONA_CORE_PRODUCT Simulator application if you load the Steamworks plugin at least once.


<a id="project-settings"></a>

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.steamworks"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

You must also add the __AppID__ assigned to your application by Steam into your `config.lua` file: 

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6]" }
application =
{
	steamworks =
	{
		appId = "YOUR_APP_ID"
	},
}
``````


## Syntax

	local steamworks = require( "plugin.steamworks" )


## Functions

#### [steamworks.addEventListener()][plugin.steamworks.addEventListener]

#### [steamworks.getAchievementImageInfo()][plugin.steamworks.getAchievementImageInfo]

#### [steamworks.getAchievementInfo()][plugin.steamworks.getAchievementInfo]

#### [steamworks.getAchievementNames()][plugin.steamworks.getAchievementNames]

#### [steamworks.getUserImageInfo()][plugin.steamworks.getUserImageInfo]

#### [steamworks.getUserInfo()][plugin.steamworks.getUserInfo]

#### [steamworks.getUserStatValue()][plugin.steamworks.getUserStatValue]

#### [steamworks.newImageRect()][plugin.steamworks.newImageRect]

#### [steamworks.newTexture()][plugin.steamworks.newTexture]

#### [steamworks.removeEventListener()][plugin.steamworks.removeEventListener]

#### [steamworks.requestActivePlayerCount()][plugin.steamworks.requestActivePlayerCount]

#### [steamworks.requestLeaderboardEntries()][plugin.steamworks.requestLeaderboardEntries]

#### [steamworks.requestLeaderboardInfo()][plugin.steamworks.requestLeaderboardInfo]

#### [steamworks.requestSetHighScore()][plugin.steamworks.requestSetHighScore]

#### [steamworks.requestUserProgress()][plugin.steamworks.requestUserProgress]

#### [steamworks.resetUserProgress()][plugin.steamworks.resetUserProgress]

#### [steamworks.resetUserStats()][plugin.steamworks.resetUserStats]

#### [steamworks.setAchievementProgress()][plugin.steamworks.setAchievementProgress]

#### [steamworks.setAchievementUnlocked()][plugin.steamworks.setAchievementUnlocked]

#### [steamworks.setNotificationPosition()][plugin.steamworks.setNotificationPosition]

#### [steamworks.setUserStatValues()][plugin.steamworks.setUserStatValues]

#### [steamworks.showGameOverlay()][plugin.steamworks.showGameOverlay]

#### [steamworks.showStoreOverlay()][plugin.steamworks.showStoreOverlay]

#### [steamworks.showUserOverlay()][plugin.steamworks.showUserOverlay]

#### [steamworks.showWebOverlay()][plugin.steamworks.showWebOverlay]

#### [steamworks.getAuthSessionTicket()][plugin.steamworks.getAuthSessionTicket]

## Properties

#### [steamworks.appId][plugin.steamworks.appId]

#### [steamworks.appOwnerSteamId][plugin.steamworks.appOwnerSteamId]

#### [steamworks.canShowOverlay][plugin.steamworks.canShowOverlay]

#### [steamworks.isLoggedOn][plugin.steamworks.isLoggedOn]

#### [steamworks.userSteamId][plugin.steamworks.userSteamId]


## Events

#### [achievementImageUpdate][plugin.steamworks.event.achievementImageUpdate]

#### [achievementInfoUpdate][plugin.steamworks.event.achievementInfoUpdate]

#### [activePlayerCount][plugin.steamworks.event.activePlayerCount]

#### [leaderboardEntries][plugin.steamworks.event.leaderboardEntries]

#### [leaderboardInfo][plugin.steamworks.event.leaderboardInfo]

#### [microtransactionAuthorization][plugin.steamworks.event.microtransactionAuthorization]

#### [overlayStatus][plugin.steamworks.event.overlayStatus]

#### [setHighScore][plugin.steamworks.event.setHighScore]

#### [userInfoUpdate][plugin.steamworks.event.userInfoUpdate]

#### [userProgressSave][plugin.steamworks.event.userProgressSave]

#### [userProgressUnload][plugin.steamworks.event.userProgressUnload]

#### [userProgressUpdate][plugin.steamworks.event.userProgressUpdate]

## Types

#### [AchievementInfo][plugin.steamworks.type.AchievementInfo]

#### [ImageInfo][plugin.steamworks.type.ImageInfo]

#### [ResultCode][plugin.steamworks.type.ResultCode]

#### [UserInfo][plugin.steamworks.type.UserInfo]
