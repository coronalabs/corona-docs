
# Apple Game Center

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Game Center
> __Platforms__			iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Game Center](https://developer.apple.com/game-center/) lets friends in on the action with leaderboards and achievements. The nomenclature used in the CORONA_CORE_PRODUCT APIs for Game Center attempt to match the official Game Center APIs as much as possible, allowing you to <nobr>cross-reference</nobr> with official Game Center documentation.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

* As of August 16, 2023, new apps and app updates that offer Game Center features need to include the Game Center entitlement. See Project Settings below and enable Game Center Support for Apple App ID Configuration. 

</div>


## Gotchas

Game Center is not supported in the simulator.

## Syntax

	local gameNetwork = require( "gameNetwork" )

## Functions

#### [gameNetwork.init()][plugin.gameNetwork-apple.init]

#### [gameNetwork.request()][plugin.gameNetwork-apple.request]

#### [gameNetwork.show()][plugin.gameNetwork-apple.show]

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

Also be sure to add the iPhone entitlement table as seen below

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.gameNetwork.apple"] =
		{
			publisherId = "com.coronalabs"
		},
	},
	iphone = {
		entitlements = {
		    ["com.apple.developer.game-center"] = true,
		},
	}
}
``````
## Sample project

* [View on GitHub](https://github.com/coronalabs/plugins-sample-gamenetwork-apple)

## Source

* [View on GitHub](https://github.com/coronalabs/plugins-source-gamenetwork-apple)
