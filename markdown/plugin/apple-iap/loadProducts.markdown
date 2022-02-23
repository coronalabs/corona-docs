
# store.loadProducts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, loadProducts
> __See also__          [store.canLoadProducts][plugin.apple-iap.canLoadProducts]
>						[store.init()][plugin.apple-iap.init]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a request to retrieve item data, dispatching a [productList][plugin.apple-iap.event.productList] event to the listener defined as `productListener`.


## Syntax

	store.loadProducts( productIdentifiers, productListener )

##### productIdentifiers ~^(required)^~
_[Table][api.type.Table]._ An array of strings indicating a list of product identifiers.

##### productListener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will receive the [productList][plugin.apple-iap.event.productList] event.
