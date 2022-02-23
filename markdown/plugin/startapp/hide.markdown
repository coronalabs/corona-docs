# startapp.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp, hide
> __See also__          [startapp.show()][plugin.startapp.show]
>						[startapp.*][plugin.startapp]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Only applies to banner ads. Removes any currently showing banner ad from the screen.


## Syntax

	startapp.hide()


## Example

``````lua
local startapp = require( "plugin.startapp" )

local function adListener( event )
    if ( event.phase == "init" ) then  -- Successful initialization
        print( event.provider )
        -- Load an StartApp ad
    end
end

-- Initialize the StartApp plugin
startapp.init( adListener, { appId="Your App ID" } )

-- Show banner ad. no need to pre-load banner
startapp.show( "banner" , {
adTag = "menu top banner",
yAlign = "top",
bannerType = "standard"
} )

-- Sometime later, hide the banner
startapp.hide()
``````
