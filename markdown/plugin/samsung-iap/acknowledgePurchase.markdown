
# store.acknowledgePurchase()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, acknowledgePurchase, acknowledge
> __See also__          [store.purchase()][plugin.samsung-iap.purchase]
>						[store.consumePurchase()][plugin.samsung-iap.consumePurchase]
>						[store.restore()][plugin.samsung-iap.restore]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Acknowledges that the user has been granted a purchased non-consumable item or subscription. Samsung&nbsp;IAP requires every non-consumable item and subscription purchase to be acknowledged after your app delivered it; the `acknowledgedStatus` field of the `"restoreCompleted"` [storeTransaction][plugin.samsung-iap.event.storeTransaction] event tells whether a purchase still needs to be acknowledged.

Consumable items are not acknowledged; use [store.consumePurchase()][plugin.samsung-iap.consumePurchase] for them.

The result is dispatched as a [storeTransaction][plugin.samsung-iap.event.storeTransaction] event with a `state` of `"acknowledged"`, one event per purchase identifier. Check `statusType` (`"success"` when the purchase was acknowledged) and `purchaseId` of the event.


## Gotchas

* Acknowledge with the `purchaseId` of the purchase, provided by the `"purchased"` and `"restoreCompleted"` [storeTransaction][plugin.samsung-iap.event.storeTransaction] events. The product identifier can not be used.

* Acknowledging requires a Galaxy Store version that supports it; on older Galaxy Store versions the `acknowledgedStatus` of restored purchases is `"unsupported"`.


## Syntax

	store.acknowledgePurchase( purchaseId )

##### purchaseId ~^(required)^~
_[String][api.type.String]._ The `purchaseId` of the purchase to acknowledge. Several purchases can be acknowledged at once by passing a comma separated string or an array of purchase identifiers. The `event.transaction` table of a [storeTransaction][plugin.samsung-iap.event.storeTransaction] event is accepted as well.


## Example

``````lua
local function transactionListener( event )
	local transaction = event.transaction

	if ( event.name == "storeTransaction" ) then
		if ( transaction.state == "purchased" or transaction.state == "restoreCompleted" ) then
			if ( not transaction.isConsumable and transaction.acknowledgedStatus ~= "acknowledged" ) then
				-- Grant the item or subscription to the user, then acknowledge it
				store.acknowledgePurchase( transaction.purchaseId )
			end

		elseif ( transaction.state == "acknowledged" ) then
			print( "acknowledged " .. transaction.purchaseId .. ": " .. transaction.statusType )
		end
	end
end
``````
