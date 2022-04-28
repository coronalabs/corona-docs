# vungle.getVersionString()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __See also__          [vungle.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the plugin and underlying SDK version numbers as a string.


## Syntax

	vungle.getVersionString()


## Example

``````lua
local vungle = require( "plugin.vungle.v6" )

local appID
if ( system.getInfo("platform") == "android" ) then
	appID = "YOUR_ANDROID_APP_ID"
else
	appID = "YOUR_IOS_APP_ID"
end

-- Vungle listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Vungle plugin
vungle.init( appID, adListener )

print( vungle.getVersionString() )
``````
