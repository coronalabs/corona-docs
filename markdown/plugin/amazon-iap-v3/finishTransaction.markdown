# store.finishTransaction()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, finishTransaction
> __See also__			[store.loadProducts()][plugin.amazon-iap-v3.loadProducts]
>						[store.purchase()][plugin.amazon-iap-v3.purchase]
>						[store.restore()][plugin.amazon-iap-v3.restore]
>						[store.*][plugin.amazon-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Notifies Amazon about the transaction being processed. This is required for all three types of <nobr>in-app</nobr> purchases (`"CONSUMABLE"`, `"ENTITLEMENT"`, or `"SUBSCRIPTION"`).

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

You must call this function following every successful transaction. If you don't, Amazon will assume that the transaction was interrupted and will attempt to resume it sometime after the next application launch.

If you're offering the item as downloadable content, do not call this function until the download is complete.

</div>


## Syntax

	store.finishTransaction( transaction )

##### transaction ~^(required)^~
_[Table][api.type.Table]._ Table containing data related to the [transaction][plugin.amazon-iap-v3.event.storeTransaction.transaction].
