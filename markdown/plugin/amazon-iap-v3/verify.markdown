# store.verify()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Amazon, IAP, in-app purchases, verify, drm
> __See also__			[store.*][plugin.amazon-iap-v3]
> --------------------- ------------------------------------------------------------------------------------------



## Syntax

	store.verify(listener)

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that will handle [licensing][plugin.amazon-iap-v3.event.licensing] events.

## Example

	``````lua
	local store = require( "plugin.amazon.iap.v3" )
	local json = require( "json" )

	local function transactionListener( event )

		if not ( event.isError ) then  -- Successful transaction
			print( json.prettify( event ) )		
			print( "event.transaction: " .. json.prettify( event.transaction ) )

		else  -- Unsuccessful transaction; output error details
			print( event.errorType )
			print( event.errorString )
		end

	end

	-- Initialize Amazon IAP
	store.init( transactionListener )


	local function licensingListener( event )

		print( event.provider )    -- Provider for this DRM instance ("amazon")
    print( event.isVerified )  -- Boolean of true if DRM has been verified, otherwise false
    print( event.isError )     -- Boolean of true if there was an error during verification
    print( event.response )    -- Translated response from the licensing server    

    if ( event.isVerified ) then
        -- License successfully verified
        print( "Verified!" )
    else
        -- Failed to verify app from Amazon
        print( "Failed!" )
    end

	end

	--Verify Licensing
	store.verify(licensingListener)


	``````
