
# event.url

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [urlRequest][api.event.urlRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          urlRequest, url
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The absolute URL of the request.

## Example
 
``````lua
local function webListener( event )
    if ( event.url ) then
        print( "You are visiting: " .. event.url )
    end
end

local webView = native.newWebView( display.contentCenterX, display.contentCenterY, 320, 480 )
webView:request( "http://www.coronalabs.com/" )

webView:addEventListener( "urlRequest", webListener )
``````
