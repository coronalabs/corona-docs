
# networkStatus

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkStatus
> __See also__          [network.setStatusListener()][api.library.network.setStatusListener]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The `networkStatus` event is used in connection with [network.setStatusListener()][api.library.network.setStatusListener] to determine whether a specific host is reachable.

## Gotchas

`networkStatus` events are only supported on macOS and iOS.

## Properties

#### [event.name][api.event.networkStatus.name]

#### [event.isReachableViaWiFi][api.event.networkStatus.isReachableViaWiFi]

#### [event.isReachableViaCellular][api.event.networkStatus.isReachableViaCellular]

#### [event.address][api.event.networkStatus.address]

#### [event.isInteractionRequired][api.event.networkStatus.isInteractionRequired]

#### [event.isConnectionOnDemand][api.event.networkStatus.isConnectionOnDemand]

#### [event.isReachable][api.event.networkStatus.isReachable]

#### [event.isConnectionRequired][api.event.networkStatus.isConnectionRequired]

