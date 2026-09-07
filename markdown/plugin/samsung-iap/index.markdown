# samsung-iap.* &mdash; Samsung IAP

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          IAP, Samsung IAP, Samsung In App Purchase
> __Platforms__			Android
> __Sample__			[https://github.com/solar2d/plugins-sample-samsung-iap](https://github.com/solar2d/plugins-sample-samsung-iap)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Samsung IAP plugin lets you sell in-app items and subscriptions through the Samsung Galaxy Store. It is built on the [Samsung In-App Purchase SDK](https://developer.samsung.com/iap) version 6.5.2 (`com.samsung.developer:iap`).


## Requirements

* Solar2D 2024.3709 or newer. Older Solar2D builds keep using the previous version of this plugin, which is based on Samsung IAP SDK 6.1 and does not provide [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase] or [store.changeSubscriptionPlan()][plugin.samsung-iap.changeSubscriptionPlan].

* Android 6.0 (API level 23) or newer. If `build.settings` specifies a lower `minSdkVersion`, the plugin raises it to 23 while building the app.

* The Samsung IAP SDK is downloaded from Maven Central while the app is built, so an internet connection is required during Android builds.


## Registration/Setup

In order to test and use In App Purchases you must [setup a Samsung Seller Account](https://seller.samsungapps.com/), create a listing to test and deploy your app for on to the Samsung App Store. Under your [Seller Profile](https://seller.samsungapps.com/member/getSellerDetail.as) be sure add the Samsung email(s) you plan to use to test under License Test. Also you need to upload an initial binary/apk for your app in order to create and test IAP products.


## Gotchas

* After a successful purchase (or a restored purchase) you must tell Samsung IAP that the item was delivered: call [store.consumePurchase()][plugin.samsung-iap.consumePurchase] for consumable items and [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase] for non-consumable items and subscriptions. Use the `purchaseId` of the [storeTransaction][plugin.samsung-iap.event.storeTransaction] event for both calls.

* Samsung IAP processes one request at a time. Wait for the event of the current request before starting the next one.

* While Samsung IAP does not require a server, in order to verify and get receipt data you can follow the [Samsung IAP Server Guide](https://developer.samsung.com/iap/programming-guide/samsung-iap-server-api.html).


## Syntax

	local store = require( "plugin.samsung.iap" )

## Properties

#### [store.target][plugin.samsung-iap.target]

#### [store.isActive][plugin.samsung-iap.isActive]

#### [store.canLoadProducts][plugin.samsung-iap.canLoadProducts]

#### [store.canMakePurchases][plugin.samsung-iap.canMakePurchases]

## Functions

#### [store.init()][plugin.samsung-iap.init]

#### [store.loadProducts()][plugin.samsung-iap.loadProducts]

#### [store.purchase()][plugin.samsung-iap.purchase]

#### [store.restore()][plugin.samsung-iap.restore]

#### [store.consumePurchase()][plugin.samsung-iap.consumePurchase]

#### [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase]

#### [store.changeSubscriptionPlan()][plugin.samsung-iap.changeSubscriptionPlan]

## Events

#### [init][plugin.samsung-iap.event.init]

#### [storeTransaction][plugin.samsung-iap.event.storeTransaction]

#### [productList][plugin.samsung-iap.event.productList]

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	plugins =
	{
		["plugin.samsung.iap"] =
		{
			publisherId = "com.solar2d"
		},
	},		
}
``````

<div class="guide-notebox">
<div class="notebox-title">Note</div>

For Android, the following permissions/features are automatically added when using this plugin:

* `"android.permission.INTERNET"`
* `"com.samsung.android.iap.permission.BILLING"`

The `<queries>` manifest element for the Galaxy Store package (`com.sec.android.app.samsungapps`) is also added automatically; the `manifestChildElements` entry that previous versions of this plugin required in `build.settings` is no longer needed, but harmless if kept.

</div>


## Support

* [https://developer.samsung.com/iap](https://developer.samsung.com/iap)
* [Solar2D Forums](https://forums.solar2d.com/c/corona-marketplace/13)
