# zip.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          zip
> __Platforms__			Android, iOS, macOS, Windows
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Zip plugin enables basic zip archive support.


## Syntax

	local zip = require( "plugin.zip" )


## Functions

#### [zip.compress()][plugin.zip.compress]

#### [zip.uncompress()][plugin.zip.uncompress]

#### [zip.list()][plugin.zip.list]


## Events

#### [zipRequest][plugin.zip.event.zipRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.zip"] =
		{
			publisherId = "com.coronalabs"
		},
	},		
}
``````
