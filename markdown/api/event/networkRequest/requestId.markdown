# event.requestId

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Userdata][api.type.Userdata]
> __Event__             [networkRequest][api.event.networkRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkRequest, requestId
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A reference to the request that corresponds to the event.  This value is the same as the value returned from the call to [network.request()][api.library.network.request], [network.upload()][api.library.network.download], or [network.download()][api.library.network.download].

This value can be used to identify the specific request, or to cancel it via [network.cancel()][api.library.network.cancel].
