
# event.address

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [networkStatus][api.event.networkStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkStatus, address
> __See also__          [network.setStatusListener()][api.library.network.setStatusListener]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The host associated with this network status change event. This information is potentially useful if you are monitoring multiple hosts with the same callback function and need to distinguish between them.

## Example
 
``````lua
local function myNetworkReachabilityListener( event )
	print( "address", event.address )
end
``````