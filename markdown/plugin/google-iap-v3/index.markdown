
# google.iap.v3.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases
> __Platforms__			Android
> --------------------- ------------------------------------------------------------------------------------------

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This plugin is deprecated. Please migrate to [Google Billing][plugin.google-iap-billing]. For more information and key differences see its [documentation][plugin.google-iap-billing].

</div>

## Overview

The Google IAP plugin allows you to support <nobr>in-app</nobr> purchasing on Android, including <nobr>in-game</nobr> currency, upgrades, and more.

For in-app purchasing on other platforms, see the documentation for [Apple IAP][plugin.apple-iap], [Amazon IAP][plugin.amazon-iap-v2] or [Store API][api.library.store].

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* To use Google IAP, begin by setting up your [Google Payments Merchant Center](https://support.google.com/wallet/business/answer/1619772) account and linking it to the [Google Play Developer Console](https://play.google.com/apps/publish).

* Additional configuration must occur within the [Google Play Developer Console](https://play.google.com/apps/publish). If you need assistance with this process, please see Google's [documentation](https://developer.android.com/google/play/billing/index.html).

</div>


<!---

## Gotchas

When building an app using the Google&nbsp;IAP plugin, ensure that the following options in the build dialog window \([guide][guide.distribution.androidBuild]\) match the `.apk` you've already uploaded to the [Google Play Developer Console](https://play.google.com/apps/publish):

* __Application name__
* __Version code__
* __Version name__
* __Package__

-->


## Syntax

	local store = require( "plugin.google.iap.v3" )


## Properties

#### [store.target][plugin.google-iap-v3.target]

#### [store.isActive][plugin.google-iap-v3.isActive]

#### [store.canLoadProducts][plugin.google-iap-v3.canLoadProducts]


## Functions

#### [store.init()][plugin.google-iap-v3.init]

#### [store.loadProducts()][plugin.google-iap-v3.loadProducts]

#### [store.purchase()][plugin.google-iap-v3.purchase]

#### [store.restore()][plugin.google-iap-v3.restore]

#### [store.consumePurchase()][plugin.google-iap-v3.consumePurchase]


## Events

#### [init][plugin.google-iap-v3.event.init]

#### [storeTransaction][plugin.google-iap-v3.event.storeTransaction]

#### [productList][plugin.google-iap-v3.event.productList]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.google.iap.v3"] =
		{
			publisherId = "com.coronalabs"
		},
	},
}
``````

In addition, you must enable the `BILLING` permission in `build.settings`:

``````{ brush="lua" gutter="false" first-line="1" highlight="[7]" }
settings =
{
	android =
	{
		usesPermissions =
		{
			"com.android.vending.BILLING",
		},
	},
}
``````

Finally, the `license` table must be added to the project `config.lua` file. Inside this table, the `key` value should be set to the corresponding key obtained from the [Google Play Developer Console](https://play.google.com/apps/publish).

``````{ brush="lua" gutter="false" first-line="1" highlight="[3,4,5,6,7,8,9]" }
application = 
{
	license =
	{
		google =
		{
			key = "YOUR_KEY",
		},
	},
}
``````
