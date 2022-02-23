# googleAnalytics.* &mdash; Google Analytics

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Google Analytics, googleAnalytics
> __Platforms__			Android, iOS
> __Sample__			[https://github.com/coronalabs/plugins-sample-googleAnalytics](https://github.com/coronalabs/plugins-sample-googleAnalytics)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Google Analytics plugin lets you measure the value of your app across all stages, discover what keeps users engaged, and learn how to make your app more successful.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

This documentation outlines the legacy Google Analytics plugin for mobile apps using non-Firebase Google Analytic. For new apps, you should use [Google Analytics v2][plugin.googleAnalytics-v2] plugin.

</div>
</div>


## Registration

Before implementing the Google Analytics plugin, you must [register for Google Analytics](https://analytics.google.com) and obtain the __tracking&nbsp;ID__ for your account.


## Syntax

	local googleAnalytics = require( "plugin.googleAnalytics" )


## Functions

#### [googleAnalytics.init()][plugin.googleAnalytics.init]

#### [googleAnalytics.logEvent()][plugin.googleAnalytics.logEvent]

#### [googleAnalytics.logScreenName()][plugin.googleAnalytics.logScreenName]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.googleAnalytics"] =
		{
			publisherId = "com.coronalabs"
		},
	},		
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`

</div>


## Support

* [https://analytics.google.com/](https://analytics.google.com/)
* [Solar2D Forums](https://forums.solar2d.com/c/corona-marketplace/13)
