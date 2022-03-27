# admob.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, isLoaded
> __See also__          [admob.show()][plugin.admob.show]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns a [boolean][api.type.Boolean] indicating whether an ad is loaded and ready for display.


## Syntax

    admob.isLoaded( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ One of the following values:

* `"interstitial"`
* `"banner"`
* `"rewardedVideo"`
* `"rewardedInterstitial"`


## Example

``````lua
local admob = require( "plugin.admob" )

-- AdMob listener function
local function adListener( event )

    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
    end
end

-- Initialize the AdMob plugin
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )

-- Sometime later, check if an interstitial ad is loaded
print( admob.isLoaded( "interstitial" ) )
``````
