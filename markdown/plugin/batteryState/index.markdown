# batteryState.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          battery, batteryState
> __Platforms__			Android, iOS, macOS, Windows
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The Battery State plugin enables battery monitoring support.


## Syntax

	local batteryState = require( "plugin.batteryState" )


## Functions

#### [batteryState.init()][plugin.batteryState.init]

#### [batteryState.getState()][plugin.batteryState.getState]


## Events

#### [batteryStateEvent][plugin.batteryState.event.batteryStateEvent]

 
## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.batteryState"] =
		{
			publisherId = "com.coronalabs"
		},
	},		
}
``````
