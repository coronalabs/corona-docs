# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [networkRequest][api.event.networkRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networkRequest, isError
> --------------------- ------------------------------------------------------------------------------------------

## Overview

If a network error occurred, this property is `true`; otherwise `false`.  If `true`, the `response` property of the event will contain a description of the error.

Note that a `404` response is _not_ a network error.  The network request succeeded but the requested item cannot be found on the server.  Network errors indicate that it isn't possible to contact the server for reasons such as the server is down or its name is incorrect.

## Example

``````lua
local function networkListener( event )
	if ( event.isError ) then
		print( "Network error: ", event.response )
	else
		print( "RESPONSE: " .. event.response )
	end
end

postData = "color=red&size=small"

local params = {}
params.body = postData

network.request( "http://127.0.0.1/formhandler.php", "POST", networkListener, params )
``````
