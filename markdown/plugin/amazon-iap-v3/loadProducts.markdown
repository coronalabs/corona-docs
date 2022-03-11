# store.loadProducts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, loadProducts
> __See also__			[store.init()][plugin.amazon-iap-v3.init]
>						[store.*][plugin.amazon-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a request to retrieve item data, dispatching a [productList][plugin.amazon-iap-v3.event.productList] event to the listener defined as `productListener`.


## Gotchas

This call can request a maximum of 100 product identifiers.


## Syntax

	store.loadProducts( productIdentifiers, productListener )

##### productIdentifiers ~^(required)^~
_[Table][api.type.Table]._ An array of strings indicating a list of product identifiers.

##### productListener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will receive the [productList][plugin.amazon-iap-v3.event.productList] event.
