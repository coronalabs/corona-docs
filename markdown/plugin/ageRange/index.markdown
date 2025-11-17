# ageRange.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          utf8, UTF-8, Unicode, string
> __Platforms__         Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This plugin is stil in alpha but is used for getting age range and app approval for the new Apple and Google apis. Google and Apple are still refining these apis. This is designed to handle new state laws in Texas and other states for app permission.  




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
		["plugin.utf8"] =
		{
			publisherId = "com.solar2d"
		},
	},		
}
``````
