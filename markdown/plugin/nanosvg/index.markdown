# nanosvg.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__				[Library][api.type.Library]
> __Revision__			[REVISION_LABEL](REVISION_URL)
> __Keywords__			SVG, nanosvg
> __Platforms__			Android, iOS, macOS, Windows, tvOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin provides the ability to rasterize simple [SVG](https://en.wikipedia.org/wiki/Scalable_Vector_Graphics) vector images using the [Nano SVG](https://github.com/memononen/nanosvg) library.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

Not all SVG files work with [Nano SVG](https://github.com/memononen/nanosvg). Be sure to test individual files for compatibility.

</div>
</div>


## Syntax

	local nanosvg = require( "plugin.nanosvg" )


## Functions

#### [nanosvg.newImage()][plugin.nanosvg.newImage]
#### [nanosvg.newTexture()][plugin.nanosvg.newTexture]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.nanosvg"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````
