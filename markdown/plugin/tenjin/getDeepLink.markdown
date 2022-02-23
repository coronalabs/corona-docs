# tenjin.getDeepLink()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Tenjin, getDeepLink
> __See also__			[tenjin.*][plugin.tenjin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`tenjin.getDeepLink()` will return [deepLinkRequest][plugin.tenjin.event.deepLinkRequest] with a deep link data, that you've setted up in Tenjin SDK dashboard.


## Syntax

	tenjin.getDeepLink( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener that will receive [deepLinkRequest][plugin.tenjin.event.deepLinkRequest] events.


## Example

``````lua
local tenjin = require( "plugin.tenjin" )

local function tenjinDeepLinkListener( event )
	-- Handle events here
end

-- Get deep link
tenjin.getDeepLink( tenjinDeepLinkListener )
``````
