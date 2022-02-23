# admob.height()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, height
> __See also__          [admob.show()][plugin.admob.show]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Only applies to banner ads. Gets the height of a <nobr>pre-loaded</nobr> banner ad in content coordinates. This function is convenient if you need to get the height of the banner before [showing][plugin.admob.show] it for <nobr>fine-tuned</nobr> positioning.

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-cog"></div>
</div>
<div class="docs-tip-inner-right">

If the device is rotated, you must [load][plugin.admob.load] a new banner and then call this function again to get the correct height value in anticipation of [showing][plugin.admob.show] it within the new device orientation.

</div>
</div>


## Syntax

	admob.height()


## Example

``````lua
local admob = require( "plugin.admob" )

-- Declare variable for storing banner height; this may change if device is rotated
local bannerHeight

-- AdMob listener function
local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Load an AdMob banner ad
		admob.load( "banner", { adUnitId="YOUR_ADMOB_AD_UNIT_ID" } )
        
	elseif ( event.phase == "loaded" ) then
		if ( event.type == "banner" ) then  -- Banner ad is loaded
			bannerHeight = admob.height()  -- Get the loaded banner's height
			-- Show the banner ad with a 30 pixel gap between the screen bottom
			admob.show( "banner", { y = display.actualContentHeight - bannerHeight - 30 } )
		end
	end
end

-- Initialize the AdMob plugin
admob.init( adListener, { appId="YOUR_ADMOB_APP_ID" } )
``````
