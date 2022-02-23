# personaly.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Persona.ly, show
> __See also__          [personaly.init()][plugin.personaly.init]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Shows a Persona.ly offer wall.


## Syntax

	personaly.show()

## Example

``````lua
local personaly = require( "plugin.personaly" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
		-- Show an ad
		personaly.show()
	end
end

-- Initialize the Persona.ly plugin
personaly.init( adListener, { appHash="YOUR_APP_HASH", userId="UNIQUE_USER_ID" } )
``````
