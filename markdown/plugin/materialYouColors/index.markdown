# materialYouColors.* &mdash; Material You Colors

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Material You Colors, Material UI
> __Platforms__			Android
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin enables you to access Material UI colors set in System Settings by the user.



## Gotchas

This plugin is supported only on Android 12 and later (Android API Level 31 and later) using CORONA_CORE_PRODUCT 2022.3672 and later.


## Syntax

	local materialYouColors = require( "plugin.materialYouColors" )



## Function


#### materialYouColors.getColors()

**Returns** a 3D array of all system Material UI colors, structured as follows:

- **1st dimension**: Represents 5 color groups — `accent1`, `accent2`, `accent3`, `neutral1`, and `neutral2`.
- **2nd dimension**: Contains 13 shades for each color group, where index `1` is the lightest and `13` is the darkest.
- **3rd dimension**: Holds the RGB components of each shade, in the order: red, green, blue.


![][images.docs.plugin-material-you-colors]




## Sample
``````lua
local myColors = materialYouColors.getColors()

local color = display.newRect( display.contentCenterX, display.contentCenterY, 50, 50 )
color:setFillColor(myColors[1][4][1], myColors[1][4][2], myColors[1][4][3])

``````



## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.materialYouColors"] =
		{
			publisherId = "com.solar2d"
		},
	},		
}
``````


## Support

* [Source code](https://github.com/solar2d/com.solar2d-plugin.materialYouColors/)
* [Sample project](https://github.com/solar2d/com.solar2d-plugin.materialYouColors/tree/master/demo)
* [Forums](https://forums.solar2d.com/c/corona-marketplace/13)
