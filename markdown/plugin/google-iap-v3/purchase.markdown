
# store.purchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, purchase
> __See also__          [store.init()][plugin.google-iap-v3.init]
>						[store.*][plugin.google-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a purchase transaction on a provided product by sending out a purchase request to the store, then dispatches a [storeTransaction][plugin.google-iap-v3.event.storeTransaction] event to the listener defined in [store.init()][plugin.google-iap-v3.init].


## Gotchas

This call does not work for subscription purchases.


## Syntax

	store.purchase( productIdentifier )

##### productIdentifier ~^(required)^~
_[String][api.type.String]._ String representing the product identifier of the item to purchase.

