# event.invalidProducts

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [productList][plugin.samsung-iap.event.productList]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, productList, invalidProducts
> __See also__			[productList][plugin.samsung-iap.event.productList]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Lua array ([table][api.type.Table]) of the product identifiers ([strings][api.type.String]) passed to [store.loadProducts()][plugin.samsung-iap.loadProducts] that Samsung IAP did not return any product information for. The array is empty when [event.isError][plugin.samsung-iap.event.productList.isError] is `true`.
