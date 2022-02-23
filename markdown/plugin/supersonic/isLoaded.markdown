# supersonic.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Supersonic, isLoaded
> __See also__          [supersonic.show()][plugin.supersonic.show]
>						[supersonic.load()][plugin.supersonic.load]
>						[supersonic.*][plugin.supersonic]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks whether an ad is already loaded. Returns `true` if an ad is loaded/ready, otherwise returns `false`.


## Syntax

	supersonic.isLoaded( adUnitType )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad you wish to check is loaded. Supported values are `"offerWall"`, `"interstitial"`, or `"rewardedVideo"`.


## Example

``````lua
local supersonic = require( "plugin.supersonic" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load an offer wall ad
		supersonic.load( "offerWall", "user2353" )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the Supersonic plugin
supersonic.init( adListener, { appKey="YOUR_APP_KEY" } )

-- Sometime later, check if the ad is loaded
local isAdLoaded = supersonic.isLoaded( "offerWall" )
print( isAdLoaded )
``````
