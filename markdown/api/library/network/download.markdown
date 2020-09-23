# network.download()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [network.*][api.library.network]
> __Return value__      [Userdata][api.type.Userdata]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          asynchronous, http, https, get, post, download
> __See also__          [network.request()][api.library.network.request]
>                       [network.cancel()][api.library.network.cancel]
>                       [network.upload()][api.library.network.upload]
>                       [networkRequest][api.event.networkRequest]
>                       [display.loadRemoteImage()][api.library.display.loadRemoteImage]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This API is a convenience method that is very similar to the asynchronous [network.request()][api.library.network.request], except that it always attempts to download the response to a local file that you specify. In fact, this method simply calls [network.request()][api.library.network.request], putting the destination `filename` and `baseDirectory` parameters into `params.response` and specifying `"download"` progress notifications. 

You can also use [display.loadRemoteImage()][api.library.display.loadRemoteImage] to download and display a remote image in a single API call.

This function returns a handle that can be passed to [network.cancel()][api.library.network.cancel] in order to cancel the request.

## Gotchas

You cannot execute a network download during an `applicationSuspend` or `applicationExit` [event][api.event.system.type]. When your application suspends, no callbacks will fire. You can work around this by saving the request you wish to make to a file upon suspension. Then, on an `applicationResume` [event][api.event.system.type], check if there is a pending download saved and, if so, execute it.

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

	network.download( url, method, listener [, params], filename [, baseDirectory] )

##### url ~^(required)^~
_[String][api.type.String]._ The HTTP request URL.  This must conform to the usual rules for [URLs](http://en.wikipedia.org/wiki/Url) (see example below if you want to use non-ASCII characters in the URL).

##### method ~^(required)^~
_[String][api.type.String]._ The HTTP method; acceptable values are `"GET"` (default) or `"POST"`.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener function invoked at various phases of the HTTP operation. This is passed a [networkRequest][api.event.networkRequest] event.

This API provides `"download"` progress when `progress` is `true`, meaning that the listener will receive events for `"began"`, `"progress"`, and `"ended"` phases. If the `progress` parameter is not enabled, the listener will only be invoked with an `"ended"` phase.

##### params ~^(optional)^~
_[Table][api.type.Table]._ Table that specifies HTTP request or response processing options, including custom request headers or body. The following keys are supported:

* `headers` &mdash; Table specifying request header values with string keys.
* `body` &mdash; String containing the request body, if any.
* `timeout` &mdash; Timeout in seconds. Default is 30 seconds.
* `bodyType` &mdash; String indicating whether a string request body is `"text"` or `"binary"`. Default is `"text"`.
* `progress` &mdash; Setting to `true` enables progress events. Default is `nil`, indicating that only the `"ended"` phase event is desired.

##### filename ~^(required)^~
_[String][api.type.String]._ The name of the file to which the response will be saved.

##### baseDirectory ~^(optional)^~
_[Constant][api.type.Constant]._ The directory where the file will be saved. Defaults to [system.DocumentsDirectory][api.library.system.DocumentsDirectory] if not provided. Cannot be set to [system.ResourceDirectory][api.library.system.ResourceDirectory] since that directory is <nobr>read-only.</nobr>


## Examples

##### Download and Display Remote Image

``````lua
local function networkListener( event )
	if ( event.isError ) then
		print( "Network error - download failed: ", event.response )
	elseif ( event.phase == "began" ) then
		print( "Progress Phase: began" )
	elseif ( event.phase == "ended" ) then
		print( "Displaying response image file" )
		myImage = display.newImage( event.response.filename, event.response.baseDirectory, 60, 40 )
		myImage.alpha = 0
		transition.to( myImage, { alpha=1.0 } )
	end
end

local params = {}
params.progress = true

network.download(
	"http://docs.coronalabs.com/images/simulator/image-mask-base2.png",
	"GET",
	networkListener,
	params,
	"maskCopy.png",
	system.TemporaryDirectory
)
``````

##### Using Non-ASCII Characters in URL

``````lua
--If you want to include non-ASCII characters in the URL, you must "urlencode" (http://en.wikipedia.org/wiki/Urlencode) them.
--Note that your browser does this behind the scenes.

local json = require "json"

function urlencode( str )
	if ( str ) then
		str = string.gsub( str, "\n", "\r\n" )
		str = string.gsub( str, "([^%w ])",
              function ( c ) return string.format ( "%%%02X", string.byte( c ) ) end )
		str = string.gsub( str, " ", "+" )
	end
	return str
end

function myNetworkListener( event )
	print( "myNetworkListener: "..json.encode( event, { indent=true } ) )
end

addedText = "これはテストです"
local paramFormat = "&parm3=".. urlencode( addedText )
local request = "http://127.0.0.1/~tester/response.php?info=11&parm1=1&parm2=2".. paramFormat

network.download( request, "GET", myNetworkListener, "result.txt", system.DocumentsDirectory )
``````
