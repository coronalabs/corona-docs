# admob.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, hide
> __See also__          [admob.show()][plugin.admob.show]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Only applies to banner ads. Removes any currently showing banner ad from the screen and prevents new banner ads from being retrieved until <nobr>`admob.show( "banner" )`</nobr> is called again.


## Syntax

	admob.hide()


## Example

``````lua
local admob = require( "plugin.admob" )

-- AdMob listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load an AdMob banner ad
		admob.load( "banner", { adUnitId="YOUR_ADMOB_AD_UNIT_ID" } )
        
	elseif ( event.phase == "loaded" ) then
		if ( event.type == "banner" ) then  -- Banner ad is loaded
			-- Show a banner ad
			admob.show( "banner" )
		end
	end
end

-- Initialize the AdMob plugin
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )

-- Sometime later, hide the banner
admob.hide()
``````