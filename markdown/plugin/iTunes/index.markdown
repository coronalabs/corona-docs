# iTunes.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          iTunes, media, library, song, music
> __Platforms__			iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The iTunes plugin enables you to access the user's iTunes library and play media from it.


## Gotchas

You must include the following keys/descriptions in the `plist` table of `build.settings`. When the system prompts the user to allow access, the associated description is displayed as part of the alert. Note that these descriptions can be customized to your preference and they can even be localized \([guide][guide.distribution.localization]\).

``````lua
settings =
{
	iphone =
	{
		plist =
		{
			NSAppleMusicUsageDescription = "This app would like to access your music library.",
		},
	},
}
``````


## Syntax

	local iTunes = require( "plugin.iTunes" )


## Functions

#### [iTunes.isPlaying()][plugin.iTunes.isPlaying]

#### [iTunes.getVolume()][plugin.iTunes.getVolume]

#### [iTunes.pause()][plugin.iTunes.pause]

#### [iTunes.play()][plugin.iTunes.play]

#### [iTunes.resume()][plugin.iTunes.resume]

#### [iTunes.setVolume()][plugin.iTunes.setVolume]

#### [iTunes.show()][plugin.iTunes.show]

#### [iTunes.stop()][plugin.iTunes.stop]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.iTunes"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Support

* [Corona Forums](http://forums.coronalabs.com/forum/631-corona-premium-plugins/)
