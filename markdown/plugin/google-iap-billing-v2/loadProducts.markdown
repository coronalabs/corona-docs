
# store.loadProducts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, loadProducts
> __See also__          [store.canLoadProducts][plugin.google-iap-billing-v2.canLoadProducts]
>						[store.init()][plugin.google-iap-billing-v2.init]
>						[store.*][plugin.google-iap-billing-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a request to retrieve item data, dispatching a [productList][plugin.google-iap-billing-v2.event.productList] event to the listener defined as `productListener`.


## Syntax

	store.loadProducts( productIdentifiers, [subscriptionIdentifiers,] productListener )

##### productIdentifiers ~^(required)^~
_[Table][api.type.Table]._ An array of strings indicating a list of product identifiers of in app purchases to be loaded.

##### subscriptionIdentifiers ~^(optional)^~
_[Table][api.type.Table]._ An array of strings indicating a list of product identifiers of subscriptions to be loaded.

##### productListener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will receive the [productList][plugin.google-iap-billing-v2.event.productList] event.
