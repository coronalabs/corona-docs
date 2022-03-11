# store.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, init
> __See also__			[store.isActive][plugin.amazon-iap-v3.isActive]
>						[store.*][plugin.amazon-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This call is required and must be executed before making other Amazon&nbsp;IAP calls. This prepares the Amazon&nbsp;IAP library and, upon successful initialization, sets [store.isActive][plugin.amazon-iap-v3.isActive] to `true`.

This also initiates the process to retrieve any pending/future purchases, dispatching a [storeTransaction][plugin.amazon-iap-v3.event.storeTransaction] event to the listener defined as `listener`.


## Syntax

	store.init( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will handle [storeTransaction][plugin.amazon-iap-v3.event.storeTransaction] events.


## Example

``````lua
local store = require( "plugin.amazon.iap.v3" )
local json = require( "json" )

-- Transaction listener function
local function transactionListener( event )

	if not ( event.isError ) then  -- Successful transaction
		print( json.prettify( event ) )		
		print( "event.transaction: " .. json.prettify( event.transaction ) )

	else  -- Unsuccessful transaction; output error details
		print( event.errorType )
		print( event.errorString )
	end

	-- Notify Amazon about the transaction being processed
	store.finishTransaction( event.transaction )
end

-- Initialize Amazon IAP
store.init( transactionListener )
``````
