
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [networkStatus][api.event.networkStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkStatus, name
> __See also__          [network.setStatusListener()][api.library.network.setStatusListener]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

String value of `"networkStatus"`.

## Example
 
``````lua
local function myNetworkReachabilityListener( event )
	print( "name", event.name )
	print( "address", event.address )
	print( "isReachable", event.isReachable )
	print( "isConnectionRequired", event.isConnectionRequired )
	print( "isConnectionOnDemand", event.isConnectionOnDemand )
	print( "IsInteractionRequired", event.isInteractionRequired )
	print( "IsReachableViaCellular", event.isReachableViaCellular )
	print( "IsReachableViaWiFi", event.isReachableViaWiFi )
end
 
if network.canDetectNetworkStatusChanges then
	network.setStatusListener( "www.apple.com", myNetworkReachabilityListener )
else
	print( "Network reachability not supported on this platform" )
end
``````