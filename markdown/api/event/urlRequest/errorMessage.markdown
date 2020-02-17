
# event.errorMessage

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [urlRequest][api.event.urlRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          urlRequest, errorMessage
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A string with an description of an error that occurred in the URL request of a [native.newWebView()][api.library.native.newWebView] or [native.showWebPopup()][api.library.native.showWebPopup] call. This property only exists when an error has occurred, otherwise it is undefined. It may be localized depending on the user's language setting.

## Example
 
`````lua
local function webListener( event )
 
    if ( event.errorCode ) then
        native.showAlert( "Error!", event.errorMessage, { "OK" } )
    end
end

local webView = native.newWebView( display.contentCenterX, display.contentCenterY, 320, 480 )
webView:request( "http://www.coronalabs1.com/" )

webView:addEventListener( "urlRequest", webListener )
`````
