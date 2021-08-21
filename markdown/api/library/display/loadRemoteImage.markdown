
# display.loadRemoteImage()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [display.*][api.library.display]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          networking, downloading, image download, remote image
> __See also__          [network.download()][api.library.network.download]
>								[network.request()][api.library.network.request]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This a convenience method, similar to [network.download()][api.library.network.download], which returns a [display&nbsp;object][api.type.DisplayObject] containing the image, as well as saving the image to a file.


## Syntax

	display.loadRemoteImage( url, method, listener [, params], destFilename [, baseDir] [, x, y] )


##### url ~^(required)^~
_[String][api.type.String]._ The HTTP request URL which should point to a valid remote PNG or JPG file.

##### method ~^(required)^~
_[String][api.type.String]._ The HTTP method; acceptable values are `"GET"` (default) or `"POST"`.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ The listener function invoked when the HTTP operation has completed. It is passed an `event` object that contains the following properties:

* `event.response` &mdash; a string containing the destination file name. This is useful if you're writing a general event handler for a variety of file downloads.
* `event.target` &mdash; the new display object created after the image is downloaded.
* `event.isError` &mdash; a [Boolean][api.type.Boolean] value: `true` in the case of a network error; `false` if not.

##### params ~^(optional)^~
_[Table][api.type.Table]._ See the [Parameters](#params) section for more information.

##### destFilename ~^(required)^~
_[String][api.type.String]._ The name of the file to which the HTTP response will be saved.

##### baseDir ~^(optional)^~
_[Constant][api.type.Constant]._ The folder path to which the file will be saved.

##### x / y ~^(optional)^~
_[Numbers][api.type.Number]._ The __x__ and __y__ coordinates to place the newly created display object, once the file has been successfully downloaded and saved.


<a id="params"></a>

## Parameters

The `params` table is an optional table that specifies custom HTTP headers or body to include in the request. To specify custom headers, attach a `headers` table that specifies header values with string keys. To specify a custom body message, attach a `body` property to this table whose string value is the HTTP body.

``````lua
local params = {}
params.headers = {}  -- contains header values to send with your request
params.body = ""     -- specific body to send with your request
``````

##### headers ~^(optional)^~
_[Table][api.type.Table]._ A table specifying header values with string keys.

##### body ~^(optional)^~
_[String][api.type.String]._ Contains the HTTP body to send with your request.


## Gotchas

Nothing is returned from calling this function. The listener callback will contain the [display object][api.type.DisplayObject] value (`event.target`) if the download was successful.


## Image Guidelines

* Corona supports PNG and JPG format.
* Images should not contain an embedded ICC profile.
* Avoid progressive JPG files since they will take much longer to load.


## Examples

##### Standard

`````lua
local function networkListener( event )
    if ( event.isError ) then
        print ( "Network error - download failed" )
    else
        event.target.alpha = 0
        transition.to( event.target, { alpha = 1.0 } )
    end

    print ( "event.response.fullPath: ", event.response.fullPath )
    print ( "event.response.filename: ", event.response.filename )
    print ( "event.response.baseDirectory: ", event.response.baseDirectory )
end
 
display.loadRemoteImage( "https://plugins.solar2d.com/images/logo-banner.png", "GET", networkListener, "logo-banner.png", system.TemporaryDirectory, 50, 50 )
`````

##### Cancel Remote Load Before Completion

``````lua
--The 'display.loadRemoteImage()' API call is a convenience method around the 'network.request()' API.
--The code below is the implementation of 'display.loadRemoteImage()'. If you need to cancel your call,
--feel free to use the code below and modify it to your needs.

local function networkListener( event )
    if ( event.isError ) then
        print ( "Network error - download failed" )
    else
        event.target.alpha = 0
        transition.to( event.target, { alpha = 1.0 } )
    end

    print ( "event.response.fullPath: ", event.response.fullPath )
    print ( "event.response.filename: ", event.response.filename )
    print ( "event.response.baseDirectory: ", event.response.baseDirectory )
end

local function remoteImageListener( self, event )
    local listener = self.listener

    local target
    if ( not event.isError and event.phase == "ended" ) then
        target = display.newImage( self.filename, self.baseDir, self.x, self.y )
        event.target = target
    end
    listener( event )
end

-- display.loadRemoteImage( url, method, listener [, params], destFilename [, baseDir] [, x, y] )
display.loadRemoteImage = function( url, method, listener, ... )
    local arg = { ... }

    local params, destFilename, baseDir, x, y
    local nextArg = 1

    if ( "table" == type( arg[nextArg] ) ) then
        params = arg[nextArg]
        nextArg = nextArg + 1
    end

    if ( "string" == type( arg[nextArg] ) ) then
        destFilename = arg[nextArg]
        nextArg = nextArg + 1
    end

    if ( "userdata" == type( arg[nextArg] ) ) then
        baseDir = arg[nextArg]
        nextArg = nextArg + 1
    else
        baseDir = system.DocumentsDirectory
    end

    if ( "number" == type( arg[nextArg] ) and "number" == type( arg[nextArg + 1] ) ) then
        x = arg[nextArg]
        y = arg[nextArg + 1]
    end

    if ( destFilename ) then
        local options = {
            x=x, 
            y=y,
            filename=destFilename, 
            baseDir=baseDir,
            networkRequest=remoteImageListener, 
            listener=listener 
        }    

        if ( params ) then
            network.download( url, method, options, params, destFilename, baseDir )
        else
            network.download( url, method, options, destFilename, baseDir )
        end
    else
        print( "ERROR: no destination filename supplied to display.loadRemoteImage()" )
    end
end

display.loadRemoteImage( 
    "https://plugins.solar2d.com/images/logo-banner.png", "GET", networkListener, "logo-banner.png", system.TemporaryDirectory, display.contentCenterX, display.contentCenterY )
``````
