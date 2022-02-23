# kochava.getVersion()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava, getVersion
> __See also__          [kochava.*][plugin.kochava]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Function returns plugin version. The data returned is formatted as a `pluginVersion` - current Corona Kochava plugin version and `sdkVersion` - current Kochava SDK version in [event.data][plugin.kochava.event.adsRequest.data].


## Syntax

	kochava.getVersion()


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

-- Sometime later, after Kochava will be fully initialized get plugin and SDK versions
kochava.getVersion()
``````
