# kochava.limitAdTracking()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava, limitAdTracking
> __See also__			[kochava.*][plugin.kochava]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Limits ad tracking and opts out of <nobr>interest-based</nobr> ads.


## Syntax

	kochava.limitAdTracking( setting )

##### setting ~^(required)^~
_[Boolean][api.type.Boolean]._  Limits ad tracking when set to `true`.


## Example

``````lua
local kochava = require( "plugin.kochava" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochava.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID"
	}
)

-- Sometime later, limit ad tracking
kochava.limitAdTracking( true )
``````
