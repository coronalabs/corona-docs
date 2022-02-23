# appStorePurchase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Dispatch chain__    &#9656; [Runtime][api.type.Runtime]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, App Store Promoted Purchases
> __See also__			[store.deferStorePurchases()][plugin.apple-iap.deferStorePurchases]
>						[store.proceedToPayment][plugin.apple-iap.proceedToPayment]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This event is generated when App Store purchase is deferred and sent to listener set by [store.deferStorePurchases()][plugin.apple-iap.deferStorePurchases].


## Properties

#### `event.name`
Always set to `"appStorePurchase"`.

#### `event.product`
Product description identical to [productList.products][plugin.apple-iap.event.productList.products] entry.

#### `event.payment`
This value can be passed to [store.proceedToPayment][plugin.apple-iap.proceedToPayment] to show the payment request. It also contains following fields

#### `event.payment.type`
Always `"payment"`

#### `event.payment.productIdentifier`
Product identifier

And other optional fields mimicking [SKPayment](https://developer.apple.com/documentation/storekit/skpayment) fields.



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
