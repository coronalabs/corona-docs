# kochava.getAttributionData()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava, getAttributionData
> __See also__			[kochava.*][plugin.kochava]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Get attribution data from Kochava.

This function will return attribution data to the Corona listener specified in [kochava.init()][plugin.kochava.init]. If no data is available, [event.data][plugin.kochava.event.analyticsRequest.data] will contain the value `false`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This function will only return data if the `enableAttributionData` parameter was set to `true` when calling [kochava.init()][plugin.kochava.init].

</div>


## Syntax

	kochava.getAttributionData()


## Example

``````lua
local kochava = require( "plugin.kochava" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochava.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID",
		enableAttributionData = true
	}
)

-- Sometime later, get attribution data
kochava.getAttributionData()
``````
