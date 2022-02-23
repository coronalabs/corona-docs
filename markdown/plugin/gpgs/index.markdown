# gpgs.* &mdash; Google Play Games Services

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __Platforms__         Android
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The [Google Play Games Services](https://marketplace.coronalabs.com/plugin/google-play-games-services) plugin enables access to <nobr>Google Play Games Services</nobr> for game networking, including achievements, leaderboards, multiplayer, quests, videos, and more.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

This documentation outlines the legacy Google Play Games Services plugin, primarily intended for Android games still using multiplayer. For new Android games, you should use [Google Play Games Services v2][plugin.gpgs2] plugin.

</div>
</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* To use this plugin, you must implement Google app licensing as outlined [here][api.library.licensing] and sign the `.apk` with a private key as outlined [here][guide.distribution.androidBuild#signrelease].

* Formerly, this plugin was also compatible with iOS, but Google no longer supports integration with iOS. If you previously implemented this service on iOS, you should migrate that implementation to another service.

<!---

* This plugin is <nobr>backward-compatible</nobr> with the legacy [gameNetwork.google][plugin.gameNetwork-google] plugin. To use it, however, you must adhere to all [Project Settings](#settings) indicated below and [require()][api.library.package.require] `"plugin.gpgs"`. In addition, you should __remove__ the legacy plugin from `build.settings` as you can __not__ include both plugins in your project.

-->

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

	local gpgs = require( "plugin.gpgs" )


## Functions

These core functions manage connection to Google's servers, authentication, and other tasks.

#### [gpgs.init()][plugin.gpgs.init]

#### [gpgs.isConnected()][plugin.gpgs.isConnected]

#### [gpgs.login()][plugin.gpgs.login]

#### [gpgs.logout()][plugin.gpgs.logout]

#### [gpgs.getAppId()][plugin.gpgs.getAppId]

#### [gpgs.getAccountName()][plugin.gpgs.getAccountName]

#### [gpgs.getServerAuthCode()][plugin.gpgs.getServerAuthCode]

#### [gpgs.getSdkVersion()][plugin.gpgs.getSdkVersion]

#### [gpgs.setPopupPosition()][plugin.gpgs.setPopupPosition]

#### [gpgs.loadGame()][plugin.gpgs.loadGame]

#### [gpgs.loadImage()][plugin.gpgs.loadImage]

#### [gpgs.showSettings()][plugin.gpgs.showSettings]

#### [gpgs.enableDebug()][plugin.gpgs.enableDebug]


## Nodes

Specific functionality aspects of this plugin are divided into nodes for better organization:

#### [gpgs.achievements][plugin.gpgs.achievements]

#### [gpgs.leaderboards][plugin.gpgs.leaderboards]

#### [gpgs.players][plugin.gpgs.players]

#### [gpgs.events][plugin.gpgs.events]

#### [gpgs.quests][plugin.gpgs.quests]

#### [gpgs.requests][plugin.gpgs.requests]

#### [gpgs.snapshots][plugin.gpgs.snapshots]

#### [gpgs.videos][plugin.gpgs.videos]



## Events

#### [init][plugin.gpgs.event.init]

#### [login][plugin.gpgs.event.login]

#### [loadGame][plugin.gpgs.event.loadGame]

#### [loadImage][plugin.gpgs.event.loadImage]

#### [showSettings][plugin.gpgs.event.showSettings]

#### [getAccountName][plugin.gpgs.event.getAccountName]

#### [getServerAuthCode][plugin.gpgs.event.getServerAuthCode]


## Types

#### [Game][plugin.gpgs.type.Game]

#### [Image][plugin.gpgs.type.Image]


<a id="settings"></a>

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8,9]" }
settings = {

	plugins =
	{
		["plugin.gpgs"] =
		{
			publisherId = "com.coronalabs",
			supportedPlatforms = { android=true }
		},
	},
}
``````

Additionally, you must specify the <nobr>Google Play Games App ID</nobr> in the `android` table of `build.settings` as the `googlePlayGamesAppId` key:

``````{ brush="lua" gutter="false" first-line="1" highlight="[5]" }
settings = {

	android =
	{
		googlePlayGamesAppId = "YOUR_APPLICATION_ID",
	},
}
``````
