
# store.purchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, purchase
> __See also__          [store.init()][plugin.apple-iap.init]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a purchase transaction on provided product(s) by sending out a purchase request to the store, then dispatches a [storeTransaction][plugin.apple-iap.event.storeTransaction] event to the listener defined in [store.init()][plugin.apple-iap.init].


## Syntax

	store.purchase( productIdentifiers )

##### productIdentifiers ~^(required)^~
_[String][api.type.String] or [Table][api.type.Table]._ String or an array (table) of strings where each string represents the product identifier of an item to purchase.
