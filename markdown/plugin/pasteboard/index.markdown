# pasteboard.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          pasteboard, clipboard, copy, paste
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Pasteboard plugin enables you to copy/paste from/to the device's pasteboard.

## Gotchas

This plugin only works on iOS and Android.

## Syntax

	local pasteboard = require( "plugin.pasteboard" )


## Functions

#### [pasteboard.clear()][plugin.pasteboard.clear]

#### [pasteboard.copy()][plugin.pasteboard.copy]

#### [pasteboard.getType()][plugin.pasteboard.getType]

#### [pasteboard.paste()][plugin.pasteboard.paste]

#### [pasteboard.setAllowedTypes()][plugin.pasteboard.setAllowedTypes]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.pasteboard"] =
		{
			publisherId = "com.coronalabs",
		},
	},
}
``````

<!---

## Sample Code

[https://github.com/coronalabs/plugins-sample-pasteboard/](https://github.com/coronalabs/plugins-sample-pasteboard)

-->

## Support

* [Forums](https://forums.solar2d.com/c/corona-marketplace/corona-premium-plugins/92)

## Sample project

* [View on GitHub](https://github.com/coronalabs/com.coronalabs-plugin.pasteboard/tree/master/src/Corona)

## Source code

* [View on GitHub](https://github.com/coronalabs/com.coronalabs-plugin.pasteboard/)
