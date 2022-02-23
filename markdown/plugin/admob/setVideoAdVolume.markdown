# admob.setVideoAdVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, setVideoAdVolume
> __See also__          [admob.show()][plugin.admob.show]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Set desired volume for video ads. Valid value are in the range `0.0` - `1.0`. `0.0` for muting ads completely. Default is `1.0`.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Video ads that are ineligible to be shown with muted audio are not returned for ad requests made when the app volume is reported as muted or set to a value of 0. This may restrict a subset of the broader video ads pool from serving.

</div>


## Syntax

    admob.setVideoAdVolume( videoAdVolume )

##### videoAdVolume ~^(required)^~
_[Number][api.type.Number]._ Desired volume for video ads. Valid values are in the range `0.0` - `1.0`. `0.0` for muting ads completely.


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

-- Sometime later, mute video ads
admob.setVideoAdVolume( 0.0 )
``````
