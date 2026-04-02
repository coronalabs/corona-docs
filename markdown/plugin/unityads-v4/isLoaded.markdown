# unityads.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, isLoaded
> __See also__          [unityads.show()][plugin.unityads-v4.show]
>						[unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [boolean][api.type.Boolean] indicating whether an ad is loaded and ready for display.


## Syntax

    unityads.isLoaded( adUnitId )

##### adUnitId ~^(required)^~
_[String][api.type.String]._ The ad unit ID configured in the [LevelPlay dashboard](https://dashboard.is.com).


## Example

``````lua
local unityads = require( "plugin.unityads.v4" )

-- Unity Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the plugin
unityads.init( adListener, { gameId="YOUR_LEVELPLAY_APP_KEY" } )

-- Sometime later, check if an ad unit ID is loaded and ready for display
print( unityads.isLoaded( "YOUR_AD_UNIT_ID" ) )
``````
