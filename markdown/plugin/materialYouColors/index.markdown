# materialYouColors.* &mdash; Material You Colors

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Material You Colors, Material UI
> __Platforms__			Android
> __Sample__			[https://github.com/solar2d/plugins-sample-samsung-iap](https://github.com/solar2d/plugins-sample-samsung-iap)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Material You Colors plugin get Material UI colors set in System Settings by the user.




## Gotchas

This features is only supported on Android 12+ (Android API Level 31+)


## Syntax

	local materialYouColors = require( "plugin.materialYouColors" )



## Function


#### materialYouColors.getColors()

returns a 3d Array of all system colors: 1d contains 5 color groups accent colors 1,2,3 and neutral colors 1,2, 2d contains 13 different shades of the color with 1 being the lightest, and 13 being the darkest, and 3d contains red, greed, blue(in that order)

![](colors.png)




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

* [demo](https://github.com/solar2d/com.solar2d-plugin.materialYouColors/tree/master/demo)
* [Solar2D Forums](https://forums.solar2d.com/c/corona-marketplace/13)
