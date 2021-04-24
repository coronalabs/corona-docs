# event.responseHeaders

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [networkRequest][api.event.networkRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkRequest, responseHeaders
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A table providing response header values with string keys.


## Example

``````lua
-- Print the Content-Type header value for a response
local function networkListener( event )
	print( "Content-Type of response is: " .. event.responseHeaders["Content-Type"] )
end
``````