# network.cancel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [network.*][api.library.network]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          asynchronous, http, https, get, post
> __See also__          [network.request()][api.library.network.request]
>                       [network.download()][api.library.network.download]
>                       [networkRequest][api.event.networkRequest]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Cancel an outstanding network request made with [network.request()][api.library.network.request], [network.upload()][api.library.network.upload], or [network.download()][api.library.network.download].


## Syntax

	network.cancel( requestId )

##### requestId ~^(required)^~
_[Userdata][api.type.Userdata]._ The request handle provided by [network.request()][api.library.network.request], [network.upload()][api.library.network.upload], or [network.download()][api.library.network.download]. This handle is returned by each of these functions and is also provided in the [networkRequest][api.event.networkRequest] event.


## Examples

##### Cancel Request Based on User Input

``````lua
local function networkListener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print( "Request complete" )
    end
end
 
-- Start the request:
local requestId = network.request( "https://encrypted.google.com", "GET", networkListener )

-- Create a cancel button that can cancel the request:
local cancelButton = display.newImage( "cancelButton.png" )

function cancelButton:tap( event )
    print( "Canceling request via cancel button" )
    network.cancel( requestId )
end

cancelButton:addEventListener( "tap", cancelButton )
``````

##### Cancel Request Inside of Progress Listener

``````lua
-- The following sample code starts an image download and, in the initial progress
-- notification, determines whether or not to continue based on the file's size.

local function networkListener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
    elseif ( event.phase == "began" ) and ( event.bytesEstimated > 80000 ) then
        print( "Canceling request, file is too big!" )
        network.cancel( event.requestId )
    end
end

-- Start the image download
network.download(
    "https://plugins.solar2d.com/images/logo-banner.png",
    "GET",
    networkListener,
    { progress = true },
    "bannerCopy.png",
    system.TemporaryDirectory )
``````
