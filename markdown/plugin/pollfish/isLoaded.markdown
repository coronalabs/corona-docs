# pollfish.isLoaded()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish, isLoaded
> __See also__          [pollfish.show()][plugin.pollfish.show]
>						[pollfish.*][plugin.pollfish]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Checks to see if a survey is loaded and ready to be displayed.


## Syntax

	pollfish.isLoaded()


## Example

``````lua
local pollfish = require( "plugin.pollfish" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		pollfish.load()
    end
end

-- Initialize the Pollfish plugin
pollfish.init( adListener, { apiKey="YOUR_API_KEY" } )

-- Sometime later, check if a survey is loaded
local isSurveyLoaded = pollfish.isLoaded()
print( isSurveyLoaded )
``````
