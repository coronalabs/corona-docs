# network.request()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [network.*][api.library.network]
> __Return value__      [Userdata][api.type.Userdata]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          asynchronous, http, https, get, post
> __See also__          [network.download()][api.library.network.download]
>                       [network.upload()][api.library.network.upload]
>                       [network.cancel()][api.library.network.cancel]
>                       [networkRequest][api.event.networkRequest]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Makes an asynchronous HTTP or HTTPS request to a URL. This function returns a handle that can be passed to [network.cancel()][api.library.network.cancel] in order to cancel the request.


## Gotchas

* You cannot execute a network request during an `applicationSuspend` or `applicationExit` [event][api.event.system.type]. When your application suspends, no callbacks will fire. You can work around this by saving the request you wish to make to a file upon suspension. Then, on an `applicationResume` [event][api.event.system.type], check if there is a pending request saved and, if so, execute it.

* The `Content-Type` of requests defaults to `text/plain`. If you're `POST`-ing form data, you must set it appropriately <nobr>(see the [example](#HTTP_POST_with_custom_headers) below).</nobr>

* Cookies may not be handled in the same way on all devices. For example, some Android devices will require app code to handle certain web login schemes correctly, especially if they use redirects.

* Network requests do not raise runtime errors in the event of failure so there is no need to wrap them in a Lua `pcall()` statement (errors&nbsp;are reported in the event sent to the network&nbsp;listener).

### Android

On Android, you must add the `INTERNET` permission to the `build.settings` file.

``````lua
settings =
{
   android =
   {
      usesPermissions =
      {
         "android.permission.INTERNET",
      },
   },
}
``````


## Syntax

	network.request( url, method, listener [, params] )

##### url ~^(required)^~
_[String][api.type.String]._ The HTTP request URL.

##### method ~^(required)^~
_[String][api.type.String]._ The HTTP method; acceptable values are `"GET"` (default), `"POST"`, `"HEAD"`, `"PUT"`, and `"DELETE"`.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener function invoked at various phases of the HTTP operation. This is passed a [networkRequest][api.event.networkRequest] event. 

The listener function can receive events of the following phases:

* `"began"` &mdash; The first notification, contains the estimated size, if known.
* `"progress"` &mdash; An intermediate progress notification.
* `"ended"` &mdash; The final notification, when the request is finished.

By default, the listener will only receive `"ended"` events.  If `params.progress` (see&nbsp;below) is `"upload"` or `"download"`, then the listener will also receive `"began"` and `"progress"` events.

If the response body is directed to a file by using `params.response` and the response was successfully written to the file, `event.response` will contain a table indicating the `filename` and `baseDirectory` for the output file.  If the request completes, but produces an error response, then any error response body will be provided as a string in `event.response` instead. This behavior prevents the destination file from being written/overwritten with an error response instead of the desired payload.

##### params ~^(optional)^~
_[Table][api.type.Table]._ A table that specifies HTTP request or response processing options, including custom request headers or body. The following keys are supported:

* `headers` &mdash; Table specifying request header values with string keys.
* `body` &mdash; String containing the request body, or alternatively, a table containing the `filename` and optionally `baseDirectory` for a file whose contents are to be used as the request body.
* `bodyType` &mdash; String indicating whether a string request body is `"text"` or `"binary"`. Default is `"text"` if `params.body` is a string or `"binary"` if it's a table specifying a file.
* `progress` &mdash; String value indicating the type of progess notifications desired, if any. May be `"upload"` or `"download"`. The notification phases include the `"began"` and `"progress"` phase events for the desired direction of progress. Default is `nil`, indicating that only the `"ended"` phase event is desired.
* `response` &mdash; Table value indicating that the response body should be written to a file and specify the `filename` and optionally the `baseDirectory` for the response file. If this value is not provided, the response body is provided as a string.
* `timeout` &mdash; Timeout in seconds. Default is 30 seconds.
* `handleRedirects` A boolean indicating whether automatic redirect handling (the default) is desired.  Set this to `false` if you want to receive 302 responses and handle them yourself.  This may be needed for certain kinds of login schemes or custom cookie handling.

Note that if a `filename` table is specified in `params.body` or in `params.response`, `baseDirectory` is an optional [Constant][api.type.Constant] that defaults to [system.DocumentsDirectory][api.library.system.DocumentsDirectory]. In the case of `params.response`, `baseDirectory` cannot be set to [system.ResourceDirectory][api.library.system.ResourceDirectory], since that directory is <nobr>read-only.</nobr>

## Examples

##### HTTPS/SSL

``````lua
-- The following sample code contacts Google's encrypted search over SSL
-- and prints the response (in this case, the HTML source of the home page)
-- to the console.

local function networkListener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end
 
-- Access Google over SSL:
network.request( "https://encrypted.google.com", "GET", networkListener )
``````


<a id="HTTP_POST_with_custom_headers"></a>

##### HTTP POST with Custom Headers

``````lua
-- The following code demonstrates sending data via HTTP POST,
-- specifying custom request headers and request body.

local function networkListener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "RESPONSE: " .. event.response )
    end
end

local headers = {}
 
headers["Content-Type"] = "application/x-www-form-urlencoded"
headers["Accept-Language"] = "en-US"
 
local body = "color=red&size=small"

local params = {}
params.headers = headers
params.body = body
 
network.request( "http://127.0.0.1/formhandler.php", "POST", networkListener, params )
``````

##### Download File with Progress Updates

``````lua
-- The following code demonstrates how to download a file, with progress updates.

local function networkListener( event )
    if ( event.isError ) then
        print( "Network error: ", event.response )

    elseif ( event.phase == "began" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download starting, size unknown" )
        else
            print( "Download starting, estimated size: " .. event.bytesEstimated )
        end

    elseif ( event.phase == "progress" ) then
        if ( event.bytesEstimated <= 0 ) then
            print( "Download progress: " .. event.bytesTransferred )
        else
            print( "Download progress: " .. event.bytesTransferred .. " of estimated: " .. event.bytesEstimated )
        end
        
    elseif ( event.phase == "ended" ) then
        print( "Download complete, total bytes transferred: " .. event.bytesTransferred )
    end
end
 
local params = {}

-- Tell network.request() that we want the "began" and "progress" events:
params.progress = "download"

-- Tell network.request() that we want the output to go to a file:
params.response = {
    filename = "solar.jpg",
    baseDirectory = system.DocumentsDirectory
}
 
network.request( "http://docs.coronalabs.com/images/simulator/image-mask-base2.png", "GET", networkListener,  params )
``````

##### Upload Text File

``````lua
-- The following code demonstrates an HTTP post, where the request body is text from a file.
-- This example demonstrates just one possible way to upload a file. Different web servers
-- and applications support different methods of file upload. For example, some REST services
-- support upload of a binary file in the body of a PUT request. Many web servers only allow
-- file uploads using multipart/form-encoded (text) request bodies in a POST request. If you
-- are going to attempt file upload, you must first understand the specific mechanism
-- supported by the specific web server or application that you will be working with,
-- then you must form your request data and choose your request method appropriately.

local function networkListener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
    else
        print ( "Upload complete!" )
    end
end

local headers = {}
 
headers["Content-Type"] = "application/json"
headers["X-API-Key"] = "13b6ac91a2"
 
local params = {}
params.headers = headers

-- Tell network.request() to get the request body from a file:
params.body = {
    filename = "object.json",
    baseDirectory = system.DocumentsDirectory        
}
 
network.request( "http://127.0.0.1/restapi.php", "POST", networkListener, params )
``````
