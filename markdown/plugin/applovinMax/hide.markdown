# applovinMax.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, AppLovin Max, hide
> __See also__          [applovinMax.init()][plugin.applovinMax.init]
>						[applovinMax.load()][plugin.applovinMax.load]
>						[applovinMax.isLoaded()][plugin.applovinMax.isLoaded]
>						[applovinMax.*][plugin.applovinMax]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides an applovin ad.

<div class="guide-notebox">
<div class="notebox-title">Notes</div>

For now only `"banner"` ads are supported in this method.

</div>


## Syntax

	applovinMax.hide( "banner" )


## Example

``````lua
local applovinMax = require( "plugin.applovinMax" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.isError )
		-- Load an AppLovin ad
		applovinMax.load( "banner", {iOSUnitId ="replace with your own", androidUnitId="replace with your own"} )

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
applovinMax.init( adListener)

-- Sometime later, show the ad
local isAdLoaded = applovinMax.isLoaded( "banner" )
if ( isAdLoaded == true ) then
	applovinMax.show( "banner" )
end

-- Sometime later, hide the ad
applovinMax.hide( "banner" )
``````
