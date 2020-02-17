# licensing.verify()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [licensing.*][api.library.ads]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          licensing, verify
> __See also__          [licensing.init()][api.library.licensing.init]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Starts the licensing verification process.

## Gotchas

If the target store is different than the provider, the function will return `false` and the listener won't be called. You should always assume that the user is validated unless otherwise stated.

## Syntax

	licensing.verify( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function for handling the status of the licensing verification. The properties sent to this listener correspond with [licensing events][api.event.licensing].


## Example

``````lua
local licensing = require( "licensing" )

-- Initialize licensing
licensing.init( "google" )

local licensingListener = {}
function licensingListener:licensing( event )

	print( event.provider )    -- Provider for this licensing instance ("google")
	print( event.isVerified )  -- Boolean of true if license has been verified, otherwise false
	print( event.isError )     -- Boolean of true if there was an error during verification
	print( event.errorType )   -- Type of error: "configuration" or "network" (nil if no error)
	print( event.response )    -- Translated response from the licensing server
	print( event.expiration )  -- Expiration time of the cached license

	if ( event.isVerified ) then
		-- License successfully verified
		print( "Verified!" )
	else
		-- Failed to verify app from the Google Play store
		print( "Failed!" )
	end
end

-- Attempt to verify the license
licensing.verify( licensingListener )
``````
