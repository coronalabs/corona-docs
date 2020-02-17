# event.bytesEstimated

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [networkRequest][api.event.networkRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkRequest, bytesEstimated
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This value indicates the number of bytes expected to be processed by the given request, if known, otherwise it will be `-1`. 

## Gotchas

* The meaning of this value depends on the type of `progress` indicated for the request.  

* If `"upload"` progress is specified, then this value corresponds to the size of the request body to be uploaded, if any.  A value of 0 indicates no request body.

* If `"download"` progress is specified, or if no progress is specified, then this value corresponds to the size of the response body to be downloaded, if any.  A value of 0 indicates no response body, and a value of -1 indicates that the response body size is unknown.

* Web servers will typically report the expected size of the transfer when sending binary files, and will typically not report the expected size for text files (including HTML documents, XML, JSON, etc), but there are exceptions to this rule.  

* This byte count represents the number of bytes projected to actually be sent over the wire, and may not correlate to the final size of the response content.  For example, many web servers will compress content before sending, and in those cases the byte count will be of the bytes of compressed content to be sent.

* In some cases web servers may provide an "estimate" of the transfer size, which not only may not match the actual content size due to compression (as explained above), but which also may not correlate as expected to the bytesReceived values.  For example, during the `"progress"` phase of a request, it is entirely possible that the bytesReceived value will exceed the bytesTotal value.  And likewise, it is possible that in the `"ended"` phase of a request you may have a bytesReceived value that is either greater than or less than the bytesTotal value.