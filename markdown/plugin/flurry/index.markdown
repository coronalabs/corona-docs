# analytics.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [CoronaProvider][api.type.CoronaProvider]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This documentation outlines the __legacy__ Flurry plugin. We recommend that you update to the current [Flurry Analytics][plugin.flurry-analytics] plugin instead.

</div>

## Overview

The Flurry plugin lets you log interesting events in your application via the [analytics][api.library.analytics] library.

## Registration

To use Flurry analytics, please [register](http://www.flurry.com) for an account.

## Syntax

	local analytics = require( "analytics" )

## Functions

#### [analytics.init()][plugin.flurry.init]

#### [analytics.logEvent()][plugin.flurry.logEvent]

## Project Settings

To use this plugin, add two entries into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["CoronaProvider.analytics.flurry"] =
		{
			publisherId = "com.coronalabs",
			supportedPlatforms = { iphone=true, android=true }
		},
		["CoronaProvider.gameNetwork.google"] =
		{
			publisherId = "com.coronalabs",
			supportedPlatforms = { android=true }
		},
	},
}
``````