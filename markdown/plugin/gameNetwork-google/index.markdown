# Google Play Games Services (legacy)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Google Play Games Services
> __Platforms__			Android
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Google Play Games Services](https://developers.google.com/games/services/) makes your games more social with capabilities for achievements, leaderboards, and other popular features using the Google Play game services SDK. Let players sign in using their Google+ identities and share their gaming experience with friends.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Note</div>

This is the __legacy__ plugin for <nobr>Google Play Games Services</nobr>. We encourage all users to migrate and upgrade to the current [Google Play Games Services](https://marketplace.coronalabs.com/plugin/google-play-games-services) plugin \([documentation][plugin.gpgs]\) which includes many more features and improved functionality.

</div>


## Syntax

	local gameNetwork = require( "gameNetwork" )


## Functions

#### [gameNetwork.init()][plugin.gameNetwork-google.init]

#### [gameNetwork.request()][plugin.gameNetwork-google.request]

#### [gameNetwork.show()][plugin.gameNetwork-google.show]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.gameNetwork.google"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

In addition, you must specify the Google Play Games App ID within the `android` table of `build.settings`:

``````lua
settings =
{
	android =
	{
		googlePlayGamesAppId = "YOUR_APP_ID",
	},
}
``````

## Support

* [https://developers.google.com/games/services/](https://developers.google.com/games/services/)
* [Corona Forums](http://forums.coronalabs.com/forum/621-game-networking/)
