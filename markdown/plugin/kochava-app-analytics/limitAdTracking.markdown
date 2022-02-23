# kochavaFAA.limitAdTracking()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava Free App Analytics, limitAdTracking
> __See also__			[kochavaFAA.*][plugin.kochava-app-analytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Limits ad tracking and opts out of <nobr>interest-based</nobr> ads.


## Syntax

	kochavaFAA.limitAdTracking( setting )

##### setting ~^(required)^~
_[Boolean][api.type.Boolean]._  Limits ad tracking when set to `true`.


## Example

``````lua
local kochavaFAA = require( "plugin.kochava.faa" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochavaFAA.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID"
	}
)

-- Sometime later, limit ad tracking
kochavaFAA.limitAdTracking( true )
``````
