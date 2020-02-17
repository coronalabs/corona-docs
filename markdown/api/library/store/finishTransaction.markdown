
# store.finishTransaction()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, finishTransaction
> __See also__          [store.loadProducts()][api.library.store.loadProducts]
>						[store.purchase()][api.library.store.purchase]
>						[store.restore()][api.library.store.restore]
>						[store.*][api.library.store]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Notifies the Apple Store that a transaction is complete.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You must call this function following every successful transaction. If you don't, Apple will assume that the transaction was interrupted and will attempt to resume it sometime after the next application launch.

If you're offering the item as downloadable content, do not call this function until the download is complete.

</div>


## Syntax

	store.finishTransaction( transaction )

##### transaction ~^(required)^~
_[Table][api.type.Table]._ Table containing data related to the [transaction][api.library.store.event.storeTransaction.transaction].
