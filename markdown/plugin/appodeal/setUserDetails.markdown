# appodeal.setUserDetails()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, setUserDetails
> __See also__          [appodeal.init()][plugin.appodeal.init]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets user details. Providing these details may help improve revenue with ads that are more specifically targeted for the user.


## Syntax

	appodeal.setUserDetails( options )

##### options ~^(required)^~
_[Table][api.type.Table]._ Table containing option values &mdash; see the next section for details.


## Options Reference

The `options` table includes parameters for specifying user details.

##### age ~^(optional)^~
_[Number][api.type.Number]._ The user's age.

##### gender ~^(optional)^~
_[String][api.type.String]._ The user's gender. Valid values include `"male"`, `"female"`, and `"other"`.

##### userId ~^(optional)^~
_[String][api.type.String]._ A unique ID to identify a user.


## Example

``````lua
local appodeal = require( "plugin.appodeal" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		-- Set user details
		appodeal.setUserDetails( { gender="female" } )
    end
end

-- Initialize the Appodeal plugin
appodeal.init( adListener, { appKey="YOUR_APP_KEY" } )
``````
