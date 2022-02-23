# kidoz.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, KIDOZ, hide
> __See also__          [kidoz.show()][plugin.kidoz.show]
>						[kidoz.*][plugin.kidoz]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides a KIDOZ ad which was previously shown via [kidoz.show()][plugin.kidoz.show].

## Syntax

	kidoz.hide( adType )

##### adType ~^(required)^~
_[String][api.type.String]._ The ad type to hide. Valid values include `"panelView"`, and `"banner"`.


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

-- Sometime later, hide the panel view
kidoz.hide( "panelView" )
``````
