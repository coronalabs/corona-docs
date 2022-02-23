# personaly.setUserDetails()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Persona.ly, setUserDetails
> __See also__          [personaly.init()][plugin.personaly.init]
>						[personaly.*][plugin.personaly]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets user details for the user&nbsp;ID given during initialization via [personaly.init()][plugin.personaly.init]. Providing these details may help improve revenue with offers targeted for the user.

## Syntax

	personaly.setUserDetails( options )

##### options ~^(required)^~
_[Table][api.type.Table]._ Table containing option values &mdash; see the next section for details.


## Options Reference

The `options` table includes parameters for specifying user details.

##### gender ~^(optional)^~
_[String][api.type.String]._ The user's gender. Valid values include `"male"` and `"female"`.

##### birthday ~^(optional)^~
_[String][api.type.String]._ The user's birthday. Date must be sepcified in <nobr>`YYYY-MM-DD`</nobr> format.


## Example

``````lua
local personaly = require( "plugin.personaly" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
	end
end

-- Initialize the Persona.ly plugin
personaly.init( adListener, { appHash="YOUR_APP_HASH", userId="UNIQUE_USER_ID" } )

-- Set user details
personaly.setUserDetails( { gender="female", birthday="1990-01-30" } )
``````
