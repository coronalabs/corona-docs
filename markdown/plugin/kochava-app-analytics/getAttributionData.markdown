# kochavaFAA.getAttributionData()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__		none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava Free App Analytics, getAttributionData
> __See also__			[kochavaFAA.*][plugin.kochava-app-analytics]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Get attribution data from Kochava.

This function will return attribution data to the Corona listener specified in [kochavaFAA.init()][plugin.kochava-app-analytics.init]. If no data is available, [event.data][plugin.kochava-app-analytics.event.analyticsRequest.data] will contain the value `false`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This function will only return data if the `enableAttributionData` parameter was set to `true` when calling [kochavaFAA.init()][plugin.kochava-app-analytics.init].

</div>


## Syntax

	kochavaFAA.getAttributionData()


## Example

``````lua
local kochavaFAA = require( "plugin.kochava.faa" )

local function kochavaListener( event )
	-- Handle events here
end

-- Initialize plugin
kochavaFAA.init( kochavaListener,
	{
		appGUID = "YOUR_APP_GUID",
		enableAttributionData = true
	}
)

-- Sometime later, get attribution data
kochavaFAA.getAttributionData()
``````
