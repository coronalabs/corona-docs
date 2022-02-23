# startapp.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp, isLoaded
> __See also__          [startapp.show()][plugin.startapp.show]
>						[startapp.*][plugin.startapp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a boolean value whether an ad is loaded and ready for show.


## Syntax

	startapp.isLoaded( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ The ad type to check. Valid values: `"interstitial"`, `"video"`, `"rewardedVideo"`, `"offerwall"`.


## Example

``````lua
local startapp = require( "plugin.startapp" )

local function adListener( event )
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
        -- Load an StartApp ad
        startapp.load( "interstitial" )
    elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
        print( event.type )
    elseif ( event.phase == "failed" ) then  -- The ad failed to load
        print( event.type )
        print( event.isError )
        print( event.response )
    end
end

-- Initialize the StartApp plugin
startapp.init( adListener, { appId="Your App ID" } )

-- Sometime later, check if the ad is loaded
print( startapp.isLoaded( "interstitial" ) )
``````
