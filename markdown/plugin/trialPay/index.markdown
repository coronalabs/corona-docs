# trialPay.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, TrialPay
> __Platforms__			Android, iOS
> --------------------- ------------------------------------------------------------------------------------------

<!---

> __Sample__			[https://github.com/coronalabs/plugins-sample-trialpay](https://github.com/coronalabs/plugins-sample-trialPay)

-->

## Overview

<div class="float-right" style="max-width: 240px; clear: both;">

![][images.docs.plugin-screenshot-trialpay]

</div>

The [TrialPay](http://www.trialpay.com/) plugin allows developers to monetize their mobile app with TrialPay static interstitials, video interstitials, rewarded videos, and offer walls.


## Registration

Before you can use this plugin, you must [register](https://merchant.trialpay.com/ref/?tp=Taf4gg1a&d=signup&t=mb) with TrialPay.


## Syntax

	local trialPay = require( "plugin.trialPay" )


## Functions

#### [trialPay.init()][plugin.trialPay.init]

#### [trialPay.show()][plugin.trialPay.show]


## Events

#### [adsRequest][plugin.trialPay.event.adsRequest]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.trialPay"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

<!--- Include ATS "override" template block --->
TEMPLATE_ATS
<!--- --->

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

On devices running Android 6.0 and higher, this plugin requires the `STORAGE` [permission group](http://developer.android.com/reference/android/Manifest.permission_group.html#STORAGE) for caching of video ads. For details on requesting permissions at runtime, please see [here][REFLINK 1].

</div>

<!--- REFERENCE LINK -->

[REFLINK 1]: ../../api/library/native/showPopup.html#requestAppPermission

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"android.permission.ACCESS_NETWORK_STATE"`
* `"android.permission.READ_PHONE_STATE"`
* `"android.permission.WRITE_EXTERNAL_STORAGE"`
* `"android.permission.ACCESS_WIFI_STATE"`

</div>


## Support

* [http://trialpay.com](http://trialpay.com)
* [Corona Forums](http://forums.coronalabs.com/forum/545-monetization-in-app-purchases-ads-etc/)
