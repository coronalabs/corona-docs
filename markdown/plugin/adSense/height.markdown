# adSense.height()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          adSense, Google Ads, Google AdSense, height
> __See also__          [adSense.show()][plugin.adSense.show]
>						[adSense.*][plugin.adSense]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns banner height in Solar2D display units


## Syntax

	adSense.height()


## Example

``````lua
local adSense = require( "plugin.adSense" )

-- AdSense Ads listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		adSense.show("banner",{adSlot="xxxxxxxxx", height=150, position="bottom"})

		--Later
		print("AdSense Banner Height")
		print(adSense.height())
	end
end

-- Initialize Ad Sense
adSense.init(adListener, {clientId="ca-pub-xxxxxxxxxxxxxxxx"} )
``````
