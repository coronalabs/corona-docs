# Google Play Games Services

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          google, google play games services, achievements, leaderboards
> __Platforms__         Android
> __Sample__            [https://github.com/coronalabs/gpgs.sample](https://github.com/coronalabs/gpgs.sample)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin enables access to Google Play Games Services API, such as achievements, leaderboards and snapshots(Saved Games).


<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

If you encounter <nobr>Google Play Games Services</nobr> login issues/errors after implementing this plugin, ensure that you have enabled <nobr>__Google Play Developer API__</nobr> within the [Google Play Developer Console](https://console.developers.google.com/).


Also in order to use [snapshots][plugin.gpgs3.snapshots] you must add __Drive&nbsp;API__ within the [Google Play Developer Console](https://console.developers.google.com/).

</div>
</div>




## Changes from GPGS V2 to V3


### Changed Apis

#### [gpgs.init()][plugin.gpgs3.init]
Initialize is now required and will attempt to sign in the player automatically

#### [gpgs.isConnected(listener)][plugin.gpgs3.isConnected]
isConnected is now async and has a callback. use isConnected to check if a player is automatically connected via [init][plugin.gpgs3.init] or manually [login][plugin.gpgs3.login] functions

#### [gpgs.isAuthenticated()][plugin.gpgs3.isAuthenticated]
isAuthenticated is actually the same but should be noted that isAuthenticated only applies for logins in via [gpgs.login()][plugin.gpgs3.login]. This is important for [Snapshots][plugin.gpgs3.snapshots] which is needed to use [gpgs.login()][plugin.gpgs3.login] for requesting __Drive&nbsp;API__ access.

#### [gpgs.login()][plugin.gpgs3.login]
There is a new `useDrive` param which is need for [Snapshots][plugin.gpgs3.snapshots]. It is import to note that the Drive scope is not added by default and you must set the `useDrive` param to `true`.

### No longer supported functions

#### gpgs.setPopupPosition()

#### gpgs.showSettings()

#### gpgs.loadGame()

#### gpgs.clearNotifications()

#### gpgs.videos.*

### Revert back to [gpgs.v2][plugin.gpgs2] to use these functions



## Syntax

	local gpgs= require( "plugin.gpgs.v3" )

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

	settings = {
		plugins = {
			["plugin.gpgs.v3"] = {
				publisherId = "com.solar2d",
			}
		}
	}

## Nodes

The plugin is divided into API nodes for better organization.

#### [gpgs.achievements][plugin.gpgs3.achievements]

#### [gpgs.leaderboards][plugin.gpgs3.leaderboards]

#### [gpgs.players][plugin.gpgs3.players]

#### [gpgs.events][plugin.gpgs3.events]

#### [gpgs.snapshots][plugin.gpgs3.snapshots]



## gpgs.*

## Overview

This is the base API node for the plugin. It manages connection to the Google's servers, authentication and general SDK tasks.

## Functions

#### [gpgs.init()][plugin.gpgs3.init]

#### [gpgs.enableDebug()][plugin.gpgs3.enableDebug]

#### [gpgs.isConnected(listener)][plugin.gpgs3.isConnected]

#### [gpgs.isAuthenticated()][plugin.gpgs3.isAuthenticated]

#### [gpgs.login(params)][plugin.gpgs3.login]

#### [gpgs.logout()][plugin.gpgs3.logout]

#### [gpgs.getAccountName(listener)][plugin.gpgs3.getAccountName]

#### [gpgs.getServerAuthCode(params)][plugin.gpgs3.getServerAuthCode]

#### [gpgs.loadImage(params)][plugin.gpgs3.loadImage]


## Events

#### [login][plugin.gpgs3.event.login]

#### [getAccountName][plugin.gpgs3.event.getAccountName]

#### [getServerAuthCode][plugin.gpgs3.event.getServerAuthCode]

#### [loadGame][plugin.gpgs3.event.loadGame]

#### [loadImage][plugin.gpgs3.event.loadImage]

## Types

#### [Game][plugin.gpgs3.type.Game]
