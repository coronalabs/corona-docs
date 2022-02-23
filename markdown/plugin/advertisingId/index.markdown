# advertisingId.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          advertising, ID
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides access to the advertising identifier.


## Syntax

	local advertisingId = require( "plugin.advertisingId" )


## Functions

#### [advertisingId.getAdvertisingId()][plugin.advertisingId.getAdvertisingId]

#### [advertisingId.isTrackingEnabled()][plugin.advertisingId.isTrackingEnabled]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.advertisingId"] =
		{
			publisherId = "com.coronalabs"
		},
	}
}
``````