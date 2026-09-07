
# store.consumePurchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, consumePurchase
> __See also__          [store.purchase()][plugin.samsung-iap.purchase]
>						[store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase]
>						[store.restore()][plugin.samsung-iap.restore]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function "consumes" a purchased consumable item and makes it available for purchase again. Once a consumable item is purchased, Samsung&nbsp;IAP considers it "owned" and it cannot be purchased again until it is consumed. Consume the item after you granted it to the user.

Non-consumable items and subscriptions must not be consumed; acknowledge them with [store.acknowledgePurchase()][plugin.samsung-iap.acknowledgePurchase] instead.

The result is dispatched as a [storeTransaction][plugin.samsung-iap.event.storeTransaction] event with a `state` of `"consumed"`, one event per purchase identifier. Check `statusType` (`"success"` when the item was consumed) and `purchaseId` of the event.


## Gotchas

* Consume with the `purchaseId` of the purchase, provided by the `"purchased"` and `"restoreCompleted"` [storeTransaction][plugin.samsung-iap.event.storeTransaction] events. The product identifier can not be used.

* Purchased items that were never consumed are returned by [store.restore()][plugin.samsung-iap.restore]; consume them then.


## Syntax

	store.consumePurchase( purchaseId )

##### purchaseId ~^(required)^~
_[String][api.type.String]._ The `purchaseId` of the purchase to consume. Several purchases can be consumed at once by passing a comma separated string or an array of purchase identifiers. The `event.transaction` table of a [storeTransaction][plugin.samsung-iap.event.storeTransaction] event is accepted as well.


## Example

``````lua
local function transactionListener( event )
	local transaction = event.transaction

	if ( event.name == "storeTransaction" and transaction.state == "purchased" and transaction.isConsumable ) then
		-- Grant the item to the user, then consume it
		store.consumePurchase( transaction.purchaseId )

	elseif ( event.name == "storeTransaction" and transaction.state == "consumed" ) then
		print( "consumed " .. transaction.purchaseId .. ": " .. transaction.statusType )
	end
end
``````
