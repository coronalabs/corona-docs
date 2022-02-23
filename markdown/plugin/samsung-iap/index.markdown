# samsung-iap.* &mdash; Samsung IAP

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          IAP, Samsung IAP, Samsung In App Purchase
> __Platforms__			Android
> __Sample__			[https://github.com/solar2d/plugins-sample-samsung-iap](https://github.com/solar2d/plugins-sample-samsung-iap)
> --------------------- ------------------------------------------------------------------------------------------


## Overview

The Samsung IAP plugin let you make in app purchases via Samsung's App Store.



## Registration/Setup

In order to test and use In App Purchases you must [setup a Samsung Seller Account](https://seller.samsungapps.com/), create a listing to test and deploy your app for on to the Samsung App Store. Under your [Seller Profile](https://seller.samsungapps.com/member/getSellerDetail.as) be sure add the Samsung email(s) you plan to use to test under License Test. Also you need to upload an initial binary/apk for your app in order to create and test IAP products.

## Gotchas

While Samsung IAP does not require server, in order to verify and get receipt data you can follow [Samsung IAP Server Guide](https://developer.samsung.com/iap/programming-guide/samsung-iap-server-api.html)


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

## Events

#### [init][plugin.samsung-iap.event.init]

#### [storeTransaction][plugin.samsung-iap.event.storeTransaction]

#### [productList][plugin.samsung-iap.event.productList]

## Project Settings

To use this plugin, add an entry into the `plugins` table of `build.settings`. When added, the build server will integrate the plugin during the build phase.

``````lua
settings =
{
	android =
	{
			manifestChildElements =
      {
					--Needed for newer versions of Android
          [[
						<queries>
						   <package android:name="com.sec.android.app.samsungapps" />
						</queries>
          ]],
      },
	},
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


</div>


## Support

* [https://developer.samsung.com/iap](https://developer.samsung.com/iap)
* [Solar2D Forums](https://forums.solar2d.com/c/corona-marketplace/13)
