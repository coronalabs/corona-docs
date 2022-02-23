# samsung-iap.loadProducts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__           IAP, Samsung IAP, Samsung In App Purchase, init
> __See also__          [store.init()][plugin.samsung-iap.init]
>						[store.purchase()][plugin.samsung-iap.purchase]
>						[store.restore()][plugin.samsung-iap.purchase]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a request to retrieve item data, dispatching a [productList][plugin.samsung-iap.event.productList] event to the listener defined as `productListener`.

## Gotchas

The `productListener` does not return invalid products and just give and error if invalid product is passed in.

## Syntax

	store.loadProducts( productIdentifiers, productListener )

##### productIdentifiers ~^(required)^~
_[Table][api.type.Table]._ An array of strings indicating a list of product identifiers.

##### productListener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will receive the [productList][plugin.samsung-iap.event.productList] event.
