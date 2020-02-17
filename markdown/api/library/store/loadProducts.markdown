
# store.loadProducts()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, loadProducts
> __See also__          [store.canLoadProducts][api.library.store.canLoadProducts]
>						[store.init()][api.library.store.init]
>						[store.*][api.library.store]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initiates a request to retrieve item data, dispatching a [productList][api.library.store.event.productList] event to the listener defined as `productListener`.


## Syntax

	store.loadProducts( productIdentifiers, productListener )

##### productIdentifiers ~^(required)^~
_[Table][api.type.Table]._ An array of strings indicating a list of product identifiers.

##### productListener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will receive the [productList][api.library.store.event.productList] event.
