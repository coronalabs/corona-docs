# startapp.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp, load
> __See also__          [startapp.show()][plugin.startapp.show]
>						[startapp.*][plugin.startapp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Preloads a StartApp ad for display upon a future call to startapp.show().
You can also call startapp.isLoaded() to verify that the ad has been loaded.


## Syntax

	startapp.load( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values: `"interstitial"`, `"video"`, `"rewardedVideo"`, `"offerwall"`.


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
``````
