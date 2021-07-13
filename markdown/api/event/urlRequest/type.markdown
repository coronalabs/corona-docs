
# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [urlRequest][api.event.urlRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          urlRequest, type
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The type of `urlRequest` event that indicates the action associated with the request. Values include:

* `"link"` &mdash; user tapped a link
* `"form"` &mdash; user submitted a form
* `"history"` &mdash; user tapped the back or forward button
* `"reload"` &mdash; user tapped the reload button
* `"formResubmit"` &mdash; user resubmitted a form
* `"other"` &mdash; some other action occurred
* `"loaded"` &mdash; finished loading the URL

## Example
 
`````lua
local function webListener( event )
    if ( event.type ) then
        print( event.type )
    end
end

local webView = native.newWebView( display.contentCenterX, display.contentCenterY, 320, 480 )
webView:request( "https://solar2d.com/" )

webView:addEventListener( "urlRequest", webListener )
`````
