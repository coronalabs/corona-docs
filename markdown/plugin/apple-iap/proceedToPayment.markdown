
# store.proceedToPayment()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, App Store Promoted Purchases
> __See also__          [store.deferStorePurchases()][plugin.apple-iap.deferStorePurchases]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

When your app is ready you can show [deferred][plugin.apple-iap.deferStorePurchases] payment request.


## Syntax

	store.proceedToPayment( transaction )

##### payment ~^(required)^~
_[Table][api.type.Table]._ Payment object. This value must be obtained from the [appStorePurchase.payment][plugin.apple-iap.event.appStorePurchase] field.


## Example

``````lua
local store = require( "store" )

local function transactionListener( event )
	-- ...
end
store.init( transactionListener )


local function deferredPurchases(event)
	local payment = event.payment

	-- Tore `payment` somewhere and when time is right call
	store.proceedToPayment(payment)
end
store.deferStorePurchases(deferredPurchases)
``````
