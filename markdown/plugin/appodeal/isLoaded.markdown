# appodeal.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      Boolean
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, isLoaded
> __See also__          [appodeal.show()][plugin.appodeal.show]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks if an ad has been loaded for the specified ad type. By default, Appodeal automatically caches ads in the background, so there is normally no need to [load][plugin.appodeal.load] ads in advance of calling this method. However, automatic caching may be disabled when calling [appodeal.init()][plugin.appodeal.init].


## Syntax

	appodeal.isLoaded( adUnitType )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad you wish to check. Valid values include `"banner"`, `"interstitial"`, and `"rewardedVideo"`.


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  
        -- Successful initialization

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="YOUR_APP_KEY" } )

-- Sometime later, check if an ad is available
if ( appodeal.isLoaded( "interstitial" ) ) then
	appodeal.show( "interstitial" )
end
``````
