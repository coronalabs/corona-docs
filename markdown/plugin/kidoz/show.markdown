# kidoz.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, KIDOZ, show
> __See also__          [kidoz.load()][plugin.kidoz.load]
>						[kidoz.hide()][plugin.kidoz.hide]
>						[kidoz.*][plugin.kidoz]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a KIDOZ ad which was previously loaded via [kidoz.load()][plugin.kidoz.load].


## Gotchas

This call does not necessarily reveal the actual ad view. For example, if you load a `"interstitial"` ad, only the initial UI handle will be shown by default. From this point, the user can tap the handle to reveal the ad view. However, the panel view can be configured without any UI element for the user to manipulate&nbsp;&mdash; in this case, `kidoz.show()` will fully reveal the ad view.


## Syntax

	kidoz.show( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ The ad type to show. Valid values include `"interstitial"`, `"rewardedVideo"`, and `"banner"`.


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
        -- Show the ad
        kidoz.show( "panelView" )
    end
end

-- Initialize the KIDOZ plugin
kidoz.init( adListener, { publisherID="YOUR_PUBLISHER_ID", securityToken="YOUR_SECURITY_TOKEN" } )
``````
