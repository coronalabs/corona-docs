# peanutlabs.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Peanut Labs, show
> __See also__          [peanutlabs.init()][plugin.peanutlabs.init]
>						[peanutlabs.*][plugin.peanutlabs]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a Peanut Labs survey.


## Syntax

	peanutlabs.show()


## Example

``````lua
local peanutlabs = require( "plugin.peanutlabs" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Show a survey
		peanutlabs.show()
	end
end

-- Initialize the Peanut Labs plugin
peanutlabs.init( adListener,
	{
		userId = "x1",
		appKey = "YOUR_APP_KEY",
		appId = 2222
	}
)
``````
