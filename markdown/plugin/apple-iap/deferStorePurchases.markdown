
# store.deferStorePurchases()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, App Store Promoted Purchases
> __See also__          [store.proceedToPayment][plugin.apple-iap.proceedToPayment]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Some times In-App Purchase can be triggered from outside of your app, say from the App Store promotion. If your app is not able to handle purchases at any time, or you require to implement the age gate before proceeding to the purchase, you can use this function to pick time when payment dialog would be shown.

When listener is set and user initiates IAP purchase from the App Store purchase would not proceed to payment immediately. Instead, [appStorePurchase][plugin.apple-iap.event.appStorePurchase] event would be generated and when it is better time to show the payment screen you can show it manually with the [store.proceedToPayment()][plugin.apple-iap.proceedToPayment] method.

Under the hood, having a listener set would case plugin to return `NO` from the [`paymentQueue(_:shouldAddStorePayment:for:)`](https://developer.apple.com/documentation/storekit/skpaymenttransactionobserver/2877502-paymentqueue). You can pass `nil` to remove the listener.


## Syntax

	store.deferStorePurchases( appStorePurchaseListener )

##### appStorePurchaseListener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will receive the [appStorePurchase][plugin.apple-iap.event.appStorePurchase] event instead of showing the purchase window immediately when purchase is triggered from outside your app.


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
