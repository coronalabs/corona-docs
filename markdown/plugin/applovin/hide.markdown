# applovin.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, hide
> __See also__          [applovin.init()][plugin.applovin.init]
>						[applovin.load()][plugin.applovin.load]
>						[applovin.isLoaded()][plugin.applovin.isLoaded]
>						[applovin.*][plugin.applovin]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides an applovin ad.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

For now only `"banner"` ads are supported in this method.

</div>


## Syntax

	applovin.hide( "banner" )


## Example

``````lua
local applovin = require( "plugin.applovin" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
		-- Load an AppLovin ad
		applovin.load( "interstitial" )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )

	elseif ( event.phase == "failed" ) then  -- The ad failed to load
		print( event.type )
		print( event.isError )
		print( event.response )

	elseif ( event.phase == "displayed" or event.phase == "playbackBegan" ) then  -- The ad was displayed/played
		print( event.type )

	elseif ( event.phase == "hidden" or event.phase == "playbackEnded" ) then  -- The ad was closed/hidden
		print( event.type )

	elseif ( event.phase == "clicked" ) then  -- The ad was clicked/tapped
		print( event.type )
	end
end

-- Initialize the AppLovin plugin
applovin.init( adListener, { sdkKey="YOUR_SDK_KEY" } )

-- Sometime later, show the ad
local isAdLoaded = applovin.isLoaded( "interstitial" )
if ( isAdLoaded == true ) then
	applovin.show( "interstitial" )
end

-- Sometime later, hide the ad
applovin.hide( "banner" )
``````
