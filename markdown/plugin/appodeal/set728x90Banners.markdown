# appodeal.set728x90Banners()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, set728x90Banners
> __See also__          [appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

You can use the following method to enable 728*90 banners.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

This method is only available on Android.

</div>


## Syntax

    appodeal.set728x90Banners( enableBanners )

##### enableBanners ~^(required)^~
_[Boolean][api.type.Boolean]._ To enable 728*90 banners, set this parameter to `true`.


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  
    -- Successful initialization

  elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )

  elseif ( event.phase == "dataReceived" ) then  -- Event data received
		print( event.type )
		print( event.data )
	end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="YOUR_APP_KEY" } )

-- Sometime later, after Appodeal will be fully initialized get plugin and SDK versions
appodeal.set728x90Banners(true)
``````
