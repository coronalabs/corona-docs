# kidoz.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, KIDOZ, isLoaded
> __See also__          [kidoz.show()][plugin.kidoz.show]
>						[kidoz.*][plugin.kidoz]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks to see if a KIDOZ ad is already loaded. Returns `true` if an ad is loaded/ready, otherwise returns `false`.


## Syntax

	kidoz.isLoaded( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ The ad type to check. Valid values include `"panelView"`, `"banner"`, and `"interstitial"`.


## Example

``````lua
local kidoz = require( "plugin.kidoz" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
		-- Load a KIDOZ panel view ad
		kidoz.load( "panelView", { adPosition="bottom" } )

	elseif ( event.phase == "loaded" ) then  -- The ad was successfully loaded
		print( event.type )
	end
end

-- Initialize the KIDOZ plugin
kidoz.init( adListener, { publisherID="YOUR_PUBLISHER_ID", securityToken="YOUR_SECURITY_TOKEN" } )

-- Sometime later, check if the panel view is loaded
local isAdLoaded = kidoz.isLoaded( "panelView" )
print( isAdLoaded )
``````
