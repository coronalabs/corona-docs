# supersonic.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Supersonic, show
> __See also__          [supersonic.init()][plugin.supersonic.init]
>						[supersonic.load()][plugin.supersonic.load]
>						[supersonic.isLoaded()][plugin.supersonic.isLoaded]
>						[supersonic.*][plugin.supersonic]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows an Supersonic ad which was previously loaded via [supersonic.load()][plugin.supersonic.load].


## Syntax

	supersonic.show( adUnitType )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad you wish to show. Supported values are `"offerWall"`, `"interstitial"`, or `"rewardedVideo"`.


## Example

``````lua
local supersonic = require( "plugin.supersonic" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load an offer wall ad
		supersonic.load( "offerWall", "user2353" )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		-- Show the ad
		supersonic.show( event.type )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the Supersonic plugin
supersonic.init( adListener, { appKey="YOUR_APP_KEY" } )
``````
