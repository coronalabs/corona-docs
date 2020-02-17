# socket.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          socket, LuaSocket, networking
> __See also__          [LuaSocket Documentation](https://rawgit.com/diegonehab/luasocket/master/doc/reference.html)
>						[network.request()][api.library.network.request]
>						[network.download()][api.library.network.download]
>						[network.canDetectNetworkStatusChanges][api.library.network.canDetectNetworkStatusChanges]
>						[network.setStatusListener()][api.library.network.setStatusListener]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

The `socket` library provides low-level access to the network stack on the host device. It is __not__ intended for general networking usage (the&nbsp;[network][api.library.network] library is much easier to&nbsp;use). There are a small number of specific tasks that require `socket` APIs, but these are uncommon and require a level of expertise in network programming that is also uncommon. Any code that uses the `socket` APIs will need ongoing tweaking as device vendors change rules for network access, for example in regard to IPv6 networks, while code written using the [network][api.library.network] APIs will generally continue to work because it is directly supported by device vendors.

</div>

Corona currently includes version <nobr>`3.0-rc1`</nobr> of the LuaSocket libraries. These Lua modules implement common network protocols such as SMTP, HTTP, and FTP. Also included are features to support MIME (common&nbsp;encodings), URL manipulation, and LTN12 for transferring and filtering data.

For asynchronous HTTP functions instead of synchronous LuaSocket functions, see [network.request()][api.library.network.request] and [network.download()][api.library.network.download].


## Gotchas

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

## Examples

##### Retrieve IP Address and Port

``````lua
local socket = require( "socket" )

-- Connect to the client
local client = socket.connect( "www.apple.com", 80 )
-- Get IP and port from client
local ip, port = client:getsockname()
 
-- Print the IP address and port to the terminal
print( "IP Address:", ip )
print( "Port:", port )
``````

##### Download Image From Remote URL

`````lua
-- Load the relevant LuaSocket modules
local http = require( "socket.http" )
local ltn12 = require( "ltn12" )
 
-- Create local file for saving data
local path = system.pathForFile( "hello.png", system.DocumentsDirectory )
myFile = io.open( path, "w+b" ) 
 
-- Request remote file and save data to local file
http.request{
	url = "http://coronalabs.com/wordpress/wp-content/uploads/2018/07/orange_vertikal_RGB.png", 
	sink = ltn12.sink.file( myFile )
}
 
-- Display local file
local testImage = display.newImage( "hello.png", system.DocumentsDirectory )
`````
