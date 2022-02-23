# facebook.isActive

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, isActive
> __See also__          [facebook.*][plugin.facebook-v4]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Used to confirm that the Facebook plugin is properly initialized after calling <nobr>`require( "plugin.facebook.v4" )`</nobr>. This property will be `true` if the Facebook plugin was successfully initialized, `false` otherwise.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Some functions/properties require `facebook.isActive` to be `true` before giving reliable results. This is noted in their respective documentation.

</div>


## Syntax

	facebook.isActive


## Example

``````lua
local facebook = require( "plugin.facebook.v4" )

local function enforceFacebookLogin()

	if ( facebook.isActive ) then
		if ( facebook.getCurrentAccessToken() == nil ) then
			print( "Login required!" )
			facebook.login()
		else
			print( "Already logged in!" )
		end
	else
		print( "Please wait for Facebook to finish initializing before checking the current access token." )
	end
end

enforceFacebookLogin()
``````
