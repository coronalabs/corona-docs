
# event.name

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [urlRequest][api.event.urlRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          urlRequest, name
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The string `urlRequest`.

## Example

`````lua
local function webListener( event )
    if ( event.name ) then
        print( event.name )
    end
end
 
local webView = native.newWebView( display.contentCenterX, display.contentCenterY, 320, 480 )
webView:request( "http://www.coronalabs.com/" )
 
webView:addEventListener( "urlRequest", webListener )
`````
