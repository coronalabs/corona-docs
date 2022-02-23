# store.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__           IAP, Samsung IAP, Samsung In App Purchase, init
> __See also__          [store.loadProducts()][plugin.samsung-iap.loadProducts]
>						[store.purchase()][plugin.samsung-iap.purchase]
>						[store.loadProducts()][plugin.samsung-iap.purchase]
>						[store.*][plugin.samsung-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Initialize the Samsung IAP plugin and set store operation mode. This step is mandatory before any other methods can be used.


## Syntax

	store.init( listener [,operationMode] )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will handle [storeTransaction][plugin.samsung-iap.event.storeTransaction] events.


##### operationMode ~^(optional)^~
_[String][api.type.String]._ can be set to "testMode", "testFailureMode", or "production"(default).

"testMode": financial transactions do not occur (licensed testers are not billed for item purchases), and successful results are always returned.

"testFailureMode" : meant to be a negative testing to ensure that your app can handle errors

"production" : requests are processed as specified, financial transactions do occur for successful requests, and actual results are returned

## Example

``````lua
local store = require( "plugin.samsung.iap" )
local json = require( "json" )

local function transactionListener( event )

	-- Samsung IAP initialization event
	if ( event.name == "init" ) then

		if not ( event.transaction.isError ) then
			-- Perform steps to enable IAP, load products, etc.

		else  -- Unsuccessful initialization; output error details
			print( event.transaction.errorType )
			print( event.transaction.errorString )
		end

	-- Store transaction event
	elseif ( event.name == "storeTransaction" ) then

		if not ( event.transaction.state == "failed" ) then  -- Successful transaction
			print( json.prettify( event ) )
			print( "event.transaction: " .. json.prettify( event.transaction ) )

		else  -- Unsuccessful transaction; output error details
			print( event.transaction.errorType )
			print( event.transaction.errorString )
		end
	end
end

-- Initialize Samsung IAP with test
store.init( transactionListener, "testMode" )
``````
