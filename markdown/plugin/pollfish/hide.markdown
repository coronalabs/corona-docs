# pollfish.hide()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish, hide
> __See also__          [pollfish.show()][plugin.pollfish.show]
>						[pollfish.*][plugin.pollfish]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Hides the Pollfish survey button.


## Syntax

	pollfish.hide()


## Example

``````lua
local pollfish = require( "plugin.pollfish" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )

	elseif ( event.phase == "loaded" ) then
		pollfish.show()
    end
end

-- Initialize the Pollfish plugin
pollfish.init( adListener, { apiKey="YOUR_API_KEY" } )

-- Sometime later, hide the Pollfish button
pollfish.hide()
``````
