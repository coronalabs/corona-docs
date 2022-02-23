# supersonic.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Supersonic
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

<!---
> __Sample__			[https://github.com/coronalabs/plugins-sample-supersonic](https://github.com/coronalabs/plugins-sample-supersonic)
-->

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This Supersonic plugin serves as the official plugin for the <nobr>re-branded</nobr> [ironSource](http://www.ironsrc.com) network.

</div>

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Check out new `hasUserConsent` init parameter to enable GDPR data collection restrictions.

</div>


## Overview

The Supersonic plugin allows developers to monetize their mobile app with Supersonic static interstitials, rewarded videos, and offer walls.


## Registration

Before you can use this plugin, you must [register](https://platform.supersonic.com/partners/signup) with Supersonic.


## Syntax

	local supersonic = require( "plugin.supersonic" )


## Functions

#### [supersonic.init()][plugin.supersonic.init]

#### [supersonic.load()][plugin.supersonic.load]

#### [supersonic.show()][plugin.supersonic.show]

#### [supersonic.isLoaded()][plugin.supersonic.isLoaded]


## Events

#### [adsRequest][plugin.supersonic.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.supersonic"] =
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


## Support

* [http://developers.supersonic.com/submit-a-request/](http://developers.supersonic.com/submit-a-request/)
* [Corona Forums](http://forums.coronalabs.com/forum/545-monetization-in-app-purchases-ads-etc/)
