
# event.isReachableViaWiFi

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [networkStatus][api.event.networkStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkStatus, isReachableViaWiFi
> __See also__          [network.setStatusListener()][api.library.network.setStatusListener]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property is `true` if the requested host is reachable via WiFi.

Note that on Mac, ethernet also counts as WiFi.

## Gotchas

`networkStatus` events are only supported on macOS and iOS.

## Example
 
``````lua
local function myNetworkReachabilityListener( event )
	print( "IsReachableViaWiFi", event.isReachableViaWiFi )
end
``````
