
# store.* (Apple IAP)

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases
> __Platforms__			iOS, tvOS
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This library allows you to support <nobr>in-app</nobr> purchasing on iOS, including <nobr>in-game</nobr> currency, upgrades, and more.

For in-app purchasing on other platforms, see the documentation for [Google IAP][plugin.google-iap-v3] or [Amazon IAP][plugin.amazon-iap-v2].

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

* To use <nobr>in-app</nobr> purchases on iOS, you must first configure your iOS certificates, App&nbsp;IDs, and provisioning profiles. Please review our [Provisioning and Building][guide.distribution.iOSBuild] guide thoroughly, as this is an essential task and you must complete each step correctly. Also remember to create an App&nbsp;ID that is unique and fully qualified, __not__ a wildcard App&nbsp;ID.

* Additional configuration must occur within [iTunes&nbsp;Connect](https://itunesconnect.apple.com/). If you need assistance with this process, please see Apple's [documentation](https://developer.apple.com/library/ios/technotes/tn2259/_index.html).

</div>


## Syntax

	local store = require( "store" )


## Properties

#### [store.target][api.library.store.target]

#### [store.isActive][api.library.store.isActive]

#### [store.canLoadProducts][api.library.store.canLoadProducts]

#### [store.canMakePurchases][api.library.store.canMakePurchases]


## Functions

#### [store.init()][api.library.store.init]

#### [store.loadProducts()][api.library.store.loadProducts]

#### [store.purchase()][api.library.store.purchase]

#### [store.finishTransaction()][api.library.store.finishTransaction]

#### [store.restore()][api.library.store.restore]


## Events

#### [storeTransaction][api.library.store.event.storeTransaction]

#### [productList][api.library.store.event.productList]
