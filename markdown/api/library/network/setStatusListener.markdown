# network.setStatusListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [network.*][api.library.network]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          network status, reachability, setStatusListener
> __See also__          [network.canDetectNetworkStatusChanges][api.library.network.canDetectNetworkStatusChanges]
>                       [networkStatus][api.event.networkStatus]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Starts monitoring a host for its network reachability status. This API is designed around the idea that you are monitoring individual hosts and not the hardware directly. Potentially, some hosts might continue to be reachable while others are not due to internet conditions, firewall configurations, authentication rules, and whether you need full DNS routing.

## Gotchas

* Network reachability \([networkStatus][api.event.networkStatus]\) events are only supported on macOS and iOS.

* Currently only named hosts are supported. IP addresses will not work.

* This API allows monitoring of multiple host URLs with separate or common event listeners. Call this API for each host URL to monitor.

* There is a potential bug that returns a false connection status if you attempt to monitor a URL address with subfolders like `"www.apple/xyz"` on a cellular network. However, the URL should return the correct connection status when using WiFi.

## Syntax

	network.setStatusListener( hostURL, listener )

##### hostURL ~^(required)^~
_[String][api.type.String]._ The host you want to monitor. This may be something like `"www.solar2d.com"`. You should not include `http://` or the port number.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener that gets [networkStatus][api.event.networkStatus] events for the specified host. Pass `nil` to unregister the listener that's set for the specified host.


## Example

``````lua
function networkListener( event )
    print( "address", event.address )
    print( "isReachable", event.isReachable )
    print( "isConnectionRequired", event.isConnectionRequired )
    print( "isConnectionOnDemand", event.isConnectionOnDemand )
    print( "IsInteractionRequired", event.isInteractionRequired )
    print( "IsReachableViaCellular", event.isReachableViaCellular )
    print( "IsReachableViaWiFi", event.isReachableViaWiFi )
    -- If you want to remove the listener, call network.setStatusListener( "www.apple.com", nil ) 
end
 
if ( network.canDetectNetworkStatusChanges ) then
    network.setStatusListener( "www.apple.com", networkListener )
else
    print( "Network reachability not supported on this platform." )
end
``````
