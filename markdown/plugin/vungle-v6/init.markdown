# vungle.init()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle
> __See also__          [vungle.load()][plugin.vungle-v6.load]
>						[vungle.show()][plugin.vungle-v6.show]
>						[vungle.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

`vungle.init()` initializes the Vungle plugin. This call is required and must be executed before making other Vungle calls such as [vungle.load()][plugin.vungle-v6.load] or [vungle.show()][plugin.vungle-v6.show].


## Syntax

	vungle.init( appID [, adListener] )


##### appID ~^(required)^~
_[String][api.type.String]._  The App ID for your app, gathered from the Vungle dashboard.

##### adListener ~^(optional)^~
_[Listener][api.type.Listener]._ The [function][api.type.Function] or [table][api.type.Table] that will handle [adsRequest][plugin.vungle-v6.event.adsRequest] lifecycle events from the Vungle plugin.


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
``````
