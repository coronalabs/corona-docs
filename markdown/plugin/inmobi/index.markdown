# inMobi.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, InMobi
> __Platforms__			Android, iOS
> __Sample__			[https://github.com/coronalabs/plugins-sample-inmobi](https://github.com/coronalabs/plugins-sample-inmobi)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The InMobi plugin allows developers to monetize their mobile app with InMobi banner and static interstitial ads.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new `hasUserConsent`  init parameter to enable GDPR data collection restrictions.

</div>


## Registration

Before you can use this plugin, you must [register](https://www.inmobi.com/user/index#signup) with InMobi.


## Syntax

	local inMobi = require( "plugin.inMobi" )


## Functions

#### [inMobi.init()][plugin.inmobi.init]

#### [inMobi.load()][plugin.inmobi.load]

#### [inMobi.show()][plugin.inmobi.show]

#### [inMobi.hide()][plugin.inmobi.hide]

#### [inMobi.isLoaded()][plugin.inmobi.isLoaded]

#### [inMobi.setUserDetails()][plugin.inmobi.setUserDetails]


## Events

#### [adsRequest][plugin.inmobi.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.inMobi"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

<!--- Include ATS "override" template block --->
TEMPLATE_ATS
<!--- --->

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`

</div>
