
# store.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google, IAP, in-app purchases, init
> __See also__			[store.isActive][plugin.google-iap-v3.isActive]
>						[store.*][plugin.google-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This call is required and must be made before making other Google&nbsp;IAP calls. This prepares the Google&nbsp;IAP library and allows you to detect [storeTransaction][plugin.google-iap-v3.event.storeTransaction] events to the listener defined as `listener`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This method also dispatches an [init][plugin.google-iap-v3.event.init] event to the specified listener (the&nbsp;same listenter used for [storeTransaction][plugin.google-iap-v3.event.storeTransaction]&nbsp;events). At this point, [store.isActive][plugin.google-iap-v3.isActive] will be `true` unless an error occurred.

To reiterate, you must wait until the [init][plugin.google-iap-v3.event.init] event is dispatched before attempting to [load products][plugin.google-iap-v3.loadProducts], [restore][plugin.google-iap-v3.restore] <nobr>previously-purchased</nobr> items, [consume][plugin.google-iap-v3.consumePurchase] an item, etc.

Note that initialization is done ansynchronously because it may require network calls which take a variable amount of time depending on server load and network latencies.

</div>


## Syntax

	store.init( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will handle [storeTransaction][plugin.google-iap-v3.event.storeTransaction] events. Note that this listener will also handle the [init][plugin.google-iap-v3.event.init] event as outlined above.


## Example

``````lua
local store = require( "plugin.google.iap.v3" )
local json = require( "json" )

local function transactionListener( event )

	-- Google IAP initialization event
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

-- Initialize Google IAP
store.init( transactionListener )
``````
