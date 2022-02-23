
# store.purchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, purchase
> __See also__          [store.init()][plugin.samsung-iap.init]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a purchase transaction on a provided product by sending out a purchase request to the store, then dispatches a [storeTransaction][plugin.samsung-iap.event.storeTransaction] event to the listener defined in [store.init()][plugin.samsung-iap.init].


## Gotchas

This call does not work for subscription purchases.


## Syntax

	store.purchase( productIdentifier [,passThroughParam]  )

##### productIdentifier ~^(required)^~
_[String][api.type.String]._ String representing the product identifier of the item to purchase.

##### passThroughParam ~^(optional)^~
_[String][api.type.String]._ An optional string, unique identifier (maximum: 255 bytes) assigned by your Android app to the purchase and payment transaction.
