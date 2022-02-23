# appodeal.canShow()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, canShow
> __See also__          [appodeal.show()][plugin.appodeal.show]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks if an ad can be shown for the specified ad type.


## Syntax

	appodeal.canShow( adUnitType, placement )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad you wish to check. Valid values include `"banner"`, `"interstitial"`, and `"rewardedVideo"`.

##### placement ~^(optional)^~
_[String][api.type.String]._ The placement you want the ad to be associated with. Placements allow you to separate ads impressions by places where it was shown. You can read more in [Appodeal Knowledge base](http://faq.appodeal.com/placements).


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

-- Sometime later, check if an ad can be shown
if ( appodeal.canShow( "interstitial" ) ) then
	appodeal.show( "interstitial" )
end
``````
