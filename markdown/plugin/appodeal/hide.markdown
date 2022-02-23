# appodeal.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, hide
> __See also__          [appodeal.show()][plugin.appodeal.show]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides a currently displayed Appodeal banner ad. Does not apply to interstitial or video ads.


## Syntax

	appodeal.hide( adUnitType )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad to hide. This should always be set to `"banner"`.


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Show a banner ad
		appodeal.show( "banner", { yAlign="top" } )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="YOUR_APP_KEY" } )

-- Sometime later, hide the ad
appodeal.hide( "banner" )
``````
