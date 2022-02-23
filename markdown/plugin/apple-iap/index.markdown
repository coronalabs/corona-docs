
# plugin.apple.iap.* (Apple IAP)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases
> __Platforms__			iOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This library allows you to support <nobr>in-app</nobr> purchasing on iOS, tvOS and macOS, including <nobr>in-game</nobr> currency, upgrades, and more.

For in-app purchasing on other platforms, see the documentation for [Google IAP][plugin.google-iap-v3] or [Amazon IAP][plugin.amazon-iap-v2].

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* To use <nobr>in-app</nobr> purchases on iOS, you must first configure your iOS certificates, App&nbsp;IDs, and provisioning profiles. Please review our [Provisioning and Building][guide.distribution.iOSBuild] guide thoroughly, as this is an essential task and you must complete each step correctly. Also remember to create an App&nbsp;ID that is unique and fully qualified, __not__ a wildcard App&nbsp;ID.

* Additional configuration must occur within [iTunes&nbsp;Connect](https://itunesconnect.apple.com/). If you need assistance with this process, please see Apple's [documentation](https://developer.apple.com/library/ios/technotes/tn2259/_index.html).

</div>


## Syntax

	local store = require( "plugin.apple.iap" )


## Properties

#### [store.target][plugin.apple-iap.target]

#### [store.isActive][plugin.apple-iap.isActive]

#### [store.canLoadProducts][plugin.apple-iap.canLoadProducts]

#### [store.canMakePurchases][plugin.apple-iap.canMakePurchases]


## Functions

#### [store.init()][plugin.apple-iap.init]

#### [store.loadProducts()][plugin.apple-iap.loadProducts]

#### [store.purchase()][plugin.apple-iap.purchase]

#### [store.finishTransaction()][plugin.apple-iap.finishTransaction]

#### [store.restore()][plugin.apple-iap.restore]


#### [store.receiptRawData()][plugin.apple-iap.receiptRawData]
#### [store.receiptBase64Data()][plugin.apple-iap.receiptBase64Data]
#### [store.receiptDecrypted()][plugin.apple-iap.receiptDecrypted]
#### [store.receiptAvailable()][plugin.apple-iap.receiptAvailable]
#### [store.receiptRequest()][plugin.apple-iap.receiptRequest]


#### [store.deferStorePurchases()][plugin.apple-iap.deferStorePurchases]
#### [store.proceedToPayment()][plugin.apple-iap.proceedToPayment]


## Events

#### [storeTransaction][plugin.apple-iap.event.storeTransaction]

#### [productList][plugin.apple-iap.event.productList]

#### [appStorePurchase][plugin.apple-iap.event.appStorePurchase]
