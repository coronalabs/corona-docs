
# event.errorCode

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [urlRequest][api.event.urlRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          urlRequest, errorCode
> --------------------- ------------------------------------------------------------------------------------------

## Overview

An error code if a problem occurred in the URL request of a [native.newWebView()][api.library.native.newWebView] or [native.showWebPopup()][api.library.native.showWebPopup] call. Otherwise, returns `nil`.

A platform-specific integer for the error which is not language dependent. This property only exists when an error occurs.

## Example

`````lua
local function webListener( event )

    if ( event.errorCode ) then
        native.showAlert( "Error!", event.errorMessage, { "OK" } )
    end
end

local webView = native.newWebView( display.contentCenterX, display.contentCenterY, 320, 480 )
webView:request( "https://solar2d.com/" )

webView:addEventListener( "urlRequest", webListener )
`````
