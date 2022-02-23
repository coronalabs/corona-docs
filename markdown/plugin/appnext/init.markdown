# appnext.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appnext, init
> __See also__          [appnext.createAd()][plugin.appnext.createAd]
>						[appnext.*][plugin.appnext]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This function is used for initializing the listener for all of the plugin [events][plugin.appnext.event.adEvent].


## Syntax

	appnext.init( adListener )

##### adListener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function that will receive [adEvent][plugin.appnext.event.adEvent] events.


## Example

``````lua
local appnext = require( "plugin.appnext" )

local function adListener( event )
	print( "Received " .. event.event .. " for " .. event.adKey .. " with message: " .. event.message )
end

-- Initialize the Appnext plugin
appnext.init( adListener )
``````
