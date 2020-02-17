
# event.isReachable

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [networkStatus][api.event.networkStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkStatus, isReachable
> __See also__          [network.setStatusListener()][api.library.network.setStatusListener]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property is `true` if the specified host is reachable.

## Gotchas

`networkStatus` events are only supported on macOS and iOS.

## Example
 
``````lua
local function myNetworkReachabilityListener( event )
	print( "isReachable", event.isReachable )
end
``````
