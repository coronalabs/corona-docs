# event.bytesTransferred

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [networkRequest][api.event.networkRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkRequest, bytesTransferred
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This value indicates the number of bytes processed by the given request. 

## Gotchas

This byte count represents the number of bytes actually sent over the wire in the direction of any indicated `progress`.  For `"upload"` progress, a value of 0 indicates that there is no request body to be uploaded.  For `"download"` progress, a value of 0 indicates that there is no response body to be downloaded.  In addition, this value may not correlate to the final size of the response content.  For example, many web servers will compress content before sending, and in those cases the byte count will be of the bytes of compressed content actually sent.