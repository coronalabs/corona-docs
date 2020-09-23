# network.canDetectNetworkStatusChanges

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Library__           [network.*][api.library.network]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          network status, reachability, canDetectNetworkStatusChanges
> __See also__          [network.setStatusListener()][api.library.network.setStatusListener]
>						[networkStatus][api.event.networkStatus]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns `true` if network reachability events are supported on the current platform.

## Syntax

	network.canDetectNetworkStatusChanges

## Gotchas

Network reachability \([networkStatus][api.event.networkStatus]\) events are only supported on macOS and iOS.

## Example

``````lua
local function networkListener( event )
    print( "Network event" )
end

if ( network.canDetectNetworkStatusChanges ) then
    network.setStatusListener( "https://solar2d.com/", networkListener )
else
    print( "Network reachability not supported on this platform." )
end
``````
