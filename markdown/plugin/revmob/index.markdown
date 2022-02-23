# revmob.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

<div class="float-right" style="max-width: 240px; clear: both;">

![][images.docs.plugin-screenshot-revmob]

</div>

The RevMob plugin allows developers to monetize users through [RevMob](https://coronalabs.revmobmobileadnetwork.com/home/) banner, static interstitial, video interstitial, and rewarded video ads.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, video interstitial and rewarded video ads require version 4.1 or higher.

</div>


<a id="registration"></a>

## Registration

To use this plugin, you must first [register](https://coronalabs.revmobmobileadnetwork.com/home/) with RevMob.


## Syntax

	local revmob = require( "plugin.revmob" )


## Functions

#### [revmob.init()][plugin.revmob.init]

#### [revmob.startSession()][plugin.revmob.startSession]

#### [revmob.load()][plugin.revmob.load]

#### [revmob.isLoaded()][plugin.revmob.isLoaded]

#### [revmob.show()][plugin.revmob.show]

#### [revmob.hide()][plugin.revmob.hide]

#### [revmob.setUserDetails()][plugin.revmob.setUserDetails]


## Events

#### [adsRequest][plugin.revmob.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.revmob"] =
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

* [http://www.forum.revmob.com](http://forum.revmob.com)
* [Corona Forums](http://forums.coronalabs.com/forum/545-monetization-in-app-purchases-ads-etc/)
