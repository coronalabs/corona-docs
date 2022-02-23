# Google Play Games Services

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          google, google play games services, achievements, leaderboards, multiplayer
> __Platforms__         Android
> __Sample__            [https://github.com/coronalabs/com.coronalabs-plugin.gpgs.v2](https://github.com/coronalabs/com.coronalabs-plugin.gpgs.v2/tree/master/src/Corona)
> --------------------- ------------------------------------------------------------------------------------------



## Overview

The Google Play Games Services plugin enables access to <nobr>Google Play Games Services</nobr> for game networking, including achievements, leaderboards, quests, videos, and more.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* GPGSv2 no longer supports multiplayer and Google has stopped supporting multiplayer as of March 31, 2020. See [legacy][plugin.gpgs] plugin for access to multiplayer apis.

* Formerly, this plugin was also compatible with iOS, but Google no longer supports integration with iOS. If you previously implemented this service on iOS, you should migrate that implementation to another service.


</div>

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

If you encounter <nobr>Google Play Games Services</nobr> login issues/errors after implementing this plugin, ensure that you have enabled both __Drive&nbsp;API__ and <nobr>__Google Play Developer API__</nobr> within the [Google Play Developer Console](https://console.developers.google.com/).

</div>
</div>
## Syntax

	local gpgs = require( "plugin.gpgs.v2" )

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

	settings = {
		plugins = {
			["plugin.gpgs.v2"] = {
				publisherId = "com.coronalabs",
			}
		}
	}

Additionally, you must specify the <nobr>Google Play Games App ID</nobr> in the `android` table of `build.settings` as the `googlePlayGamesAppId` key:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings = {

	android =
	{
		googlePlayGamesAppId = "YOUR_APPLICATION_ID",
	},
}
``````

## Nodes

The plugin is divided into API nodes for better organization.

#### [gpgs2.achievements][plugin.gpgs2.achievements]

#### [gpgs2.leaderboards][plugin.gpgs2.leaderboards]

#### [gpgs2.players][plugin.gpgs2.players]

#### [gpgs2.events][plugin.gpgs2.events]

#### [gpgs2.snapshots][plugin.gpgs2.snapshots]

#### [gpgs2.videos][plugin.gpgs2.videos]

## gpgs.*

## Overview

This is the base API node for the plugin. It manages connection to the Google's servers, authentication and general SDK tasks.

## Functions

#### [gpgs2.enableDebug()][plugin.gpgs2.enableDebug]

#### [gpgs2.isConnected()][plugin.gpgs2.isConnected]

#### [gpgs2.isAuthenticated()][plugin.gpgs2.isAuthenticated]

#### [gpgs2.login(params)][plugin.gpgs2.login]

#### [gpgs2.logout()][plugin.gpgs2.logout]

#### [gpgs2.getAccountName(listener)][plugin.gpgs2.getAccountName]

#### [gpgs2.getServerAuthCode(params)][plugin.gpgs2.getServerAuthCode]

#### [gpgs2.setPopupPosition(position)][plugin.gpgs2.setPopupPosition]

#### [gpgs2.loadGame(listener)][plugin.gpgs2.loadGame]

#### [gpgs2.loadImage(params)][plugin.gpgs2.loadImage]

#### [gpgs2.showSettings(listener)][plugin.gpgs2.showSettings]

## Events

#### [login][plugin.gpgs2.event.login]

#### [getAccountName][plugin.gpgs2.event.getAccountName]

#### [getServerAuthCode][plugin.gpgs2.event.getServerAuthCode]

#### [loadGame][plugin.gpgs2.event.loadGame]

#### [loadImage][plugin.gpgs2.event.loadImage]

## Types

#### [Game][plugin.gpgs2.type.Game]
