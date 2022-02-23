# pollfish.setUserDetails()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish, setUserDetails
> __See also__          [pollfish.init()][plugin.pollfish.init]
>						[pollfish.*][plugin.pollfish]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets user details. Providing these details may help improve revenue with offers targeted for the user.


## Syntax

	pollfish.setUserDetails( options )

##### options ~^(required)^~
_[Table][api.type.Table]._ Table containing option values &mdash; see the next section for details.


## Options Reference

The `options` table includes parameters for specifying user details.

##### gender ~^(optional)^~
_[String][api.type.String]._ User's gender. Valid values include `"male"`, `"female"`, and `"other"`.

##### facebookId ~^(optional)^~
_[String][api.type.String]._ User's Facebook ID.

##### twitterId ~^(optional)^~
_[String][api.type.String]._ User's Twitter ID.

##### location ~^(optional)^~
_[Table][api.type.Table]._ User's location. The `location` table includes the following parameters for specifying user location:

* `longitude` &mdash; Optional [number][api.type.Number] representing longitude.
* `latitude` &mdash; Optional [number][api.type.Number] representing latitude.
* `horizontalAccuracy` &mdash; Optional [number][api.type.Number] representing horizontal accuracy.

Note that this table is only used for iOS. For Android you can get automatic location retrieval by setting the `"android.permission.ACCESS_FINE_LOCATION"` and `"android.permission.ACCESS_COARSE_LOCATION"` permissions.

##### requestUUID ~^(optional)^~
_[String][api.type.String]._ A unique ID to identify a user. This ID is also passed through <nobr>server-to-server</nobr> callbacks.


## Example

``````lua
local pollfish = require( "plugin.pollfish" )

local function adListener( event )

	if ( event.phase == "init" ) then  -- Successful initialization
		print( event.provider )
    end
end

-- Initialize the Pollfish plugin
pollfish.init( adListener, { apiKey="YOUR_API_KEY" } )

-- Set user details
pollfish.setUserDetails( { gender="female" } )
``````
