# supersonic.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Supersonic, load
> __See also__          [supersonic.show()][plugin.supersonic.show]
>						[supersonic.isLoaded()][plugin.supersonic.isLoaded]
>						[supersonic.*][plugin.supersonic]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a Supersonic ad. You can also call [supersonic.isLoaded()][plugin.supersonic.isLoaded] to verify that the ad has been loaded and [supersonic.show()][plugin.supersonic.show] to show it.


## Syntax

	supersonic.load( adUnitType, userId )

##### adUnitType ~^(required)^~
_[String][api.type.String]._ The type of ad you wish to load. Supported values are `"offerWall"`, `"interstitial"`, or `"rewardedVideo"`.

##### userId ~^(optional)^~
_[String][api.type.String]._ The user id for the current user of your app. This can be any string value, for instance `"user123"`.

## Example

``````lua
local supersonic = require( "plugin.supersonic" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load an offer wall ad
		supersonic.load( "offerWall", "user2546" )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )
	end
end

-- Initialize the Supersonic plugin
supersonic.init( adListener, { appKey="YOUR_APP_KEY" } )
``````
