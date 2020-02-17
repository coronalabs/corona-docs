
# event.isInteractionRequired

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [networkStatus][api.event.networkStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkStatus, isInteractionRequired
> __See also__          [network.setStatusListener()][api.library.network.setStatusListener]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property is `true` if the user will be required to interact with the application to (re)connect to the host, for example if the user will need to enter a password.

## Example
 
``````lua
local function myNetworkReachabilityListener( event )
	print("IsInteractionRequired", event.isInteractionRequired )
end
``````
