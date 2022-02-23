
# store.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Apple, IAP, in-app purchases, init
> __See also__			[store.isActive][plugin.apple-iap.isActive]
>						[store.*][plugin.apple-iap]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This call is required and must be executed before making other Apple&nbsp;IAP calls. This prepares the Apple&nbsp;IAP library and, upon successful initialization, sets [store.isActive][plugin.apple-iap.isActive] to `true`.

This also allows you to detect [storeTransaction][plugin.apple-iap.event.storeTransaction] events to the listener defined as `listener`.


## Syntax

	store.init( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will handle [storeTransaction][plugin.apple-iap.event.storeTransaction] events.

For compatibility with Google IAP plugin, `store.init()` will call listener with event `"init"`.


## Example

``````lua
local store = require( "store" )
local json = require( "json" )

-- Transaction listener function
local function transactionListener( event )

	if not ( event.transaction.state == "failed" ) then  -- Successful transaction
		print( json.prettify( event ) )
		print( "event.transaction: " .. json.prettify( event.transaction ) )

    else  -- Unsuccessful transaction; output error details
        print( event.transaction.errorType )
        print( event.transaction.errorString )
    end

    -- Tell the store that the transaction is finished
    store.finishTransaction( event.transaction )
end

-- Initialize Apple IAP
store.init( transactionListener )
``````
