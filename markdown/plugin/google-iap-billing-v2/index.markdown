
# google.iap.billing.v2.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases
> __Platforms__			Android
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The [Google IAP](https://plugins.solar2d.com/?search=plugin.google.iap.billing.v2) plugin allows you to support <nobr>in-app</nobr> purchasing on Android, including <nobr>in-game</nobr> currency, upgrades, and more.

For in-app purchasing on other platforms, see the documentation for [Apple IAP][api.library.store] or [Amazon IAP][plugin.amazon-iap-v3].

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* The only code change between Google API Billing v2 and [Billing v1][plugin.google-iap-billing] is removal [event.productList.products.originalJson][plugin.google-iap-billing-v2.event.productList.products] and new publisherId in `build.settings`

* To use Google IAP, begin by setting up your [Google Payments Merchant Center](https://support.google.com/wallet/business/answer/1619772) account and linking it to the [Google Play Developer Console](https://play.google.com/apps/publish).

* Additional configuration must occur within the [Google Play Developer Console](https://play.google.com/apps/publish). If you need assistance with this process, please see Google's [documentation](https://developer.android.com/google/play/billing/index.html).

</div>

<div class="guide-notebox">
<div class="notebox-title">Compatibility with IAPv3</div>

This plugin is a drop in replacement for [previous][plugin.google-iap-v3] IAP plugin. It would even respond to `require( "plugin.google.iap.v3" )` code. But there are couple differences:

* [storeTransaction.transaction][plugin.google-iap-billing-v2.event.storeTransaction.transaction] would not have data about purchase when error occurs.

* [storeTransaction.transaction][plugin.google-iap-billing-v2.event.storeTransaction.transaction] event have additional values of `state` field.

* [store.finishTransaction][plugin.google-iap-billing-v2.event.storeTransaction.transaction] function is no longer no-op. It will acknowledge the purchase. If purchase is not acknowledged or consumed over three days it would be [refunded](https://developer.android.com/google/play/billing/integrate#process) to user.

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

	local store = require( "plugin.google.iap.billing.v2" )


## Properties

#### [store.target][plugin.google-iap-billing-v2.target]

#### [store.isActive][plugin.google-iap-billing-v2.isActive]

#### [store.canLoadProducts][plugin.google-iap-billing-v2.canLoadProducts]


## Functions

#### [store.init()][plugin.google-iap-billing-v2.init]

#### [store.loadProducts()][plugin.google-iap-billing-v2.loadProducts]

#### [store.purchase()][plugin.google-iap-billing-v2.purchase]

#### [store.purchaseSubscription()][plugin.google-iap-billing-v2.purchaseSubscription]

#### [store.restore()][plugin.google-iap-billing-v2.restore]

#### [store.consumePurchase()][plugin.google-iap-billing-v2.consumePurchase]


## Events

#### [init][plugin.google-iap-billing-v2.event.init]

#### [storeTransaction][plugin.google-iap-billing-v2.event.storeTransaction]

#### [productList][plugin.google-iap-billing-v2.event.productList]


## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build will integrate the plugin during the build phase.

``````{ brush="lua" gutter="false" first-line="1" highlight="[5,6,7,8]" }
settings =
{
	plugins =
	{
		["plugin.google.iap.billing.v2"] =
		{
			publisherId = "com.solar2d"
		},
	},
}
``````

This will add mandatory `com.android.vending.BILLING` permission to your app.

Finally, the `license` table may be added to the project `config.lua` file if you want your purchases to be verified. Inside this table, the `key` value should be set to the corresponding key obtained from the [Google Play Developer Console](https://play.google.com/apps/publish). In the Console, select your app, then click on "Monetization setup" section. Copy key from the "Licensing" section.

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
