# openudid.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          udid, openudid
> __Platforms__			iOS
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This library provides access to the universal and persistent unique device identifier (UDID).


## Syntax

	local openudid = require( "plugin.openudid" )


## Functions

#### [openudid.getValue()][plugin.openudid.getValue]

#### [openudid.setOptOut()][plugin.openudid.setOptOut]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.openudid"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````


## Support

* [Corona Forums](http://forums.coronalabs.com/forum/631-corona-premium-plugins/)