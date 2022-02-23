# pollfish.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish, show
> __See also__          [pollfish.isLoaded()][plugin.pollfish.isLoaded]
>						[pollfish.*][plugin.pollfish]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows the Pollfish survey button, assuming a survey is ready for display. You can check for survey availability using [pollfish.isLoaded()][plugin.pollfish.isLoaded].


## Syntax

	pollfish.show()

## Example

``````lua
local pollfish = require( "plugin.pollfish" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
        pollfish.load()

    elseif ( event.phase == "loaded" ) then
		pollfish.show()
    end
end

-- Initialize the Pollfish plugin
pollfish.init( adListener, { apiKey="YOUR_API_KEY" } )
``````
