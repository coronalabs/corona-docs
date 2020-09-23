# network.upload()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [network.*][api.library.network]
> __Return value__      [Userdata][api.type.Userdata]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          asynchronous, http, https, get, post, upload
> __See also__          [network.request()][api.library.network.request]
>                       [network.cancel()][api.library.network.cancel]
>                       [network.download()][api.library.network.download]
>                       [networkRequest][api.event.networkRequest]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This API is a convenience method that is very similar to the asynchronous [network.request()][api.library.network.request], except that always attempts to upload the request from a local file that you specify. In fact, this method simply calls [network.request()][api.library.network.request], putting the source `filename` and `baseDirectory` parameters into a `params.body` table, adding `contentType` as a `params.headers` request header value, and specifying `"upload"` progress notifications. 

This function returns a handle that can be passed to [network.cancel()][api.library.network.cancel] in order to cancel the request.


## Gotchas

You cannot execute a network upload during an `applicationSuspend` or `applicationExit` [event][api.event.system.type]. When your application suspends, no callbacks will fire. You can work around this by saving the request you wish to make to a file upon suspension. Then, on an `applicationResume` [event][api.event.system.type], check if there is a pending upload saved and, if so, execute it.

Network requests do not raise runtime errors in the event of failure so there is no need to wrap them in a Lua `pcall()` statement (errors are reported in the event sent to the network listener).

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

	network.upload( url, method, listener [, params], filename [, baseDirectory] [, contentType] )

##### url ~^(required)^~
_[String][api.type.String]._ The HTTP request URL.

##### method ~^(required)^~
_[String][api.type.String]._ The HTTP method; should typically be either `"PUT"` or `"POST"` for a file upload.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener function invoked at various phases of the HTTP operation. It is passed a [networkRequest][api.event.networkRequest] event. This API provides `"upload"` progress when `progress` is `true`, meaning that the listener will receive events for `"began"`, `"progress"`, and `"ended"` phases. If the `progress` parameter is not enabled, the listener will only be invoked with an `"ended"` phase.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table that specifies HTTP request processing options, including custom request headers. The following keys are supported:

* `headers` &mdash; Table specifying header values with string keys.
* `timeout` &mdash; Timeout in seconds. Default is 30 seconds. Only available on Mac/iOS.
* `bodyType` &mdash; String indicating whether a string request body is `"text"` or `"binary"`. Default is `"text"`.
* `progress` &mdash; Setting to `true` enables the progress events. Default is `nil`, indicating that only the `"ended"` phase event is desired.

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the file to upload.

##### baseDirectory ~^(optional)^~
_[Constant][api.type.Constant]._ The directory of the file to upload. Defaults to [system.DocumentsDirectory][api.library.system.DocumentsDirectory] if not provided. 

##### contentType ~^(optional)^~
_[Constant][api.type.Constant]._ The `Content-Type` of the file being uploaded. While this parameter is optional, `Content-Type` __must__ be provided either via this parameter or via a `params.header` value. 


## Example

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
    elseif ( event.phase == "ended" ) then
        print ( "Upload complete!" )
    end
end
 
network.upload( 
    "http://127.0.0.1/restapi.php", 
    "POST", 
    networkListener, 
    "object.json", 
    system.DocumentsDirectory, 
    "application/json"

)
``````
