
# store.canMakePurchases

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Samsung, IAP, in-app purchases, canMakePurchases
> __See also__          [store.purchase()][plugin.samsung-iap.purchase]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This property will be `true` if the store supports purchases, which is the case after [store.init()][plugin.samsung-iap.init] succeeded. Following confirmation, the [store.purchase()][plugin.samsung-iap.purchase] function can be used to purchase items.


## Syntax

	store.canMakePurchases


## Example

``````lua
local store = require( "plugin.samsung.iap" )

-- Transaction listener function
local function transactionListener( event )
	local transaction = event.transaction
end

-- Initialize Samsung IAP
store.init( transactionListener )

-- Sometime later, purchase an item
if ( store.canMakePurchases ) then
	store.purchase( "com.coronalabs.ExampleInAppPurchase.Consumable" )
end
``````
