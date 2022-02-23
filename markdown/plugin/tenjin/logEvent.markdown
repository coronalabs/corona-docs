# tenjin.logEvent()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Tenjin, logEvent
> __See also__			[tenjin.init()][plugin.tenjin.init]
>						[tenjin.logPurchase()][plugin.tenjin.logPurchase]
>						[tenjin.*][plugin.tenjin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sends an event to Tenjin.


## Syntax

	tenjin.logEvent( eventName [, eventValue] )

##### eventName ~^(required)^~
_[String][api.type.String]._ The name of the event.

##### eventValue ~^(optional)^~
_[Number][api.type.Number]._ An optional event value. Must be an integer. The Tenjin system will use this value to sum up and track averages for the `eventName` given.


## Example

``````lua
local tenjin = require( "plugin.tenjin" )

local function tenjinListener( event )
	-- Handle events here
end

-- Initialize plugin
tenjin.init( tenjinListener, { apiKey="YOUR_API_KEY" } )

tenjin.logEvent( "myEvent" )
``````
