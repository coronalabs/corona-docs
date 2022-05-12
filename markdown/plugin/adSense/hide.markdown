# adSense.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          AdSense, Google Ads, Google AdSense, hide
> __See also__          [adSense.show()][plugin.adSense.show]
>						[adSense.*][plugin.adSense]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hide AdSense banner ad


## Syntax

	adSense.hide(  )


## Example

``````lua
local adSense = require( "plugin.adSense" )

-- AdSense Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		adSense.show("banner",{adSlot="xxxxxxxxx", height=150, position="bottom"})

		--Later
		adSense.hide()
	end
end

-- Initialize Ad Sense
adSense.init(adListener, {clientId="ca-pub-xxxxxxxxxxxxxxxx"} )
``````
