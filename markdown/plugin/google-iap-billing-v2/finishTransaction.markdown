
# store.finishTransaction()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, purchase
> __See also__          [store.purchase()][plugin.google-iap-billing-v2.purchase]
>						[store.*][plugin.google-iap-billing-v2]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Notifies Google Play Store that purchase was processed (acknowledges it).

Following every successful transaction you must call this function and/or [consume][plugin.google-iap-billing-v2.consumePurchase] it. If you don't do it over three days, Google Play will [refund]((https://developer.android.com/google/play/billing/integrate#process)) the purchase to customer.


## Syntax

This function has two alternative syntaxes

	store.finishTransaction( transaction )
	store.finishTransaction( productIdentifier )

##### transaction ~^(required)^~
_[Table][api.type.Table]._ Table containing data related to the [transaction][plugin.google-iap-billing-v2.event.storeTransaction.transaction].

##### transaction ~^(required)^~
_[String][api.type.String]._ String representing the product identifier of the item to be acknowledged.
