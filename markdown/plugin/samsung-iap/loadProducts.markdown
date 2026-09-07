# samsung-iap.loadProducts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__           IAP, Samsung IAP, Samsung In App Purchase, loadProducts
> __See also__          [store.init()][plugin.samsung-iap.init]
>						[store.purchase()][plugin.samsung-iap.purchase]
>						[store.restore()][plugin.samsung-iap.restore]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a request to retrieve item data, dispatching a [productList][plugin.samsung-iap.event.productList] event to the listener defined as `productListener`.

## Gotchas

Product identifiers that Samsung IAP does not return are listed in [event.invalidProducts][plugin.samsung-iap.event.productList.invalidProducts]. If Samsung IAP rejects the whole request, for instance because none of the identifiers exist, the event has [event.isError][plugin.samsung-iap.event.productList.isError] set to `true` instead.

## Syntax

	store.loadProducts( productIdentifiers, productListener )

##### productIdentifiers ~^(required)^~
_[Table][api.type.Table]._ An array of strings indicating a list of product identifiers.

##### productListener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will receive the [productList][plugin.samsung-iap.event.productList] event.
