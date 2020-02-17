
# event.isConnectionOnDemand

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [networkStatus][api.event.networkStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkStatus, isConnectionOnDemand
> __See also__          [network.setStatusListener()][api.library.network.setStatusListener]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property is `true` if the connection will come up automatically, `false` otherwise.

## Example
 
``````lua
local function myNetworkReachabilityListener( event )
	print( "isConnectionOnDemand", event.isConnectionOnDemand )
end
``````