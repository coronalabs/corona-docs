
# store.canLoadProducts

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, canLoadProducts
> __See also__          [store.loadProducts()][plugin.apple-iap.loadProducts]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This property will be `true` if the store supports the loading of products. Following confirmation, the [store.loadProducts()][plugin.apple-iap.loadProducts] function can be used to retrieve information about items available for sale.


## Syntax

	store.canLoadProducts


## Example

``````lua
local store = require( "store" )

-- Transaction listener function
local function transactionListener( event )
	local transaction = event.transaction
end

-- Product listener function
local function productListener( event )
	print( "Valid products:", #event.products )
    print( "Invalid products:", #event.invalidProducts )
end

-- Initialize Apple IAP
store.init( transactionListener )

-- Sometime later, load products
if ( store.canLoadProducts ) then

	local productIdentifiers = {
		"com.coronalabs.ExampleInAppPurchase.Consumable",
		"com.coronalabs.ExampleInAppPurchase.NonConsumable"
	}
	store.loadProducts( productIdentifiers, productListener )
end
``````