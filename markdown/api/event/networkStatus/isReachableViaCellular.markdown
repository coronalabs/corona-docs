
# event.isReachableViaCellular

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [networkStatus][api.event.networkStatus]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkStatus, isReachableViaCellular
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property is `true` if the host is reachable through the cellular network.

## Gotchas

`networkStatus` events are only supported on macOS and iOS.

## Example
 
``````lua
local function myNetworkReachabilityListener( event )
	print( "IsReachableViaCellular", event.isReachableViaCellular )
end
``````
