# ageRange.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          age, age range, AgeRange, string
> __Platforms__         Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin is still in alpha but is used for getting age range and app approval for the new Apple and Google APIs. Google and Apple are still refining these APIs. This is designed to handle new state laws in Texas and other states for app permission.




## Syntax

	local ageRange = require("plugin.ageRange")


## Functions

#### [ageRange.init()][plugin.ageRange.init]

#### [ageRange.requestAgeRange()][plugin.ageRange.requestAgeRange]



## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.ageRange"] =
		{
			publisherId = "com.solar2d"
		},
	},		
}
``````
