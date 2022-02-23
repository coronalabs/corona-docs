# startapp.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp, init
> __See also__          [startapp.load()][plugin.startapp.load]
>						[startapp.*][plugin.startapp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`startapp.init()` initializes the StartApp plugin.

This call is required and must be executed before making other StartApp calls.


## Syntax

	startapp.init( listener, params )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adsRequest][plugin.startapp.event.adsRequest] events.

##### params ~^(required)^~
_[Table][api.type.Table]._ Table containing StartApp initialization values &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the StartApp initialization.

##### appID ~^(required)^~
_[String][api.type.String]._ The app ID for your app, gathered from the StartApp portal.

##### enableReturnAds ~^(optional)^~
_[Boolean][api.type.Boolean]._ Set this value to false to disable return ads. Default is true.


## Example

``````lua
local startapp = require( "plugin.startapp" )

-- StartApp listener function
local function adListener( event )
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
    end
end

-- Initialize the StartApp plugin
startapp.init( adListener, { appId="Your App ID", enableReturnAds = true } )
``````
