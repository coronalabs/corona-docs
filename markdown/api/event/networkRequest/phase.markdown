# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.string]
> __Event__             [networkRequest][api.event.networkRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkRequest, phase
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The phase of the network request. Will be one of the following values:

* `"began"` &mdash; The initial notification.
* `"progress"` &mdash; An intermediate progress notification, with an updated value for [bytesTransferred][api.event.networkRequest.bytesTransferred].
* `"ended"` &mdash; The final notification, when the request is finished.

Note that the `"began"` and `"progress"` phase notifications will only be received if `params.progress` is set to `"upload"` or `"download"` in the request.


## Gotchas

On the `"began"` phase event:

* For `"upload`" progress, this notification will be received before connecting to the remote host and starting the request.  It will contain the estimated upload size ([bytesEstimated][api.event.networkRequest.bytesEstimated]), if known.
* For `"download"` progress, this notification will be received after posting the request and receiving the response headers.  It will contain the response code, headers, and estimated size ([bytesEstimated][api.event.networkRequest.bytesEstimated]), if known.
