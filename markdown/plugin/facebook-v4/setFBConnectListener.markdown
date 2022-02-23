# facebook.setFBConnectListener

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, setFBConnectListener
> __See also__          [facebook.login()][plugin.facebook-v4.login]
>						[facebook.*][plugin.facebook-v4]
>						[fbconnect][plugin.facebook-v4.event.fbconnect]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the listener function which will receive [fbconnect][plugin.facebook-v4.event.fbconnect] events. This can be used to define a listener when there's no need for a [facebook.login()][plugin.facebook-v4.login] call.


## Syntax

	facebook.setFBConnectListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ A listener that responds to [fbconnect][plugin.facebook-v4.event.fbconnect] events. If this is a table, it should have a property `"fbconnect"` that is a function.


## Example

``````lua
local facebook = require( "plugin.facebook.v4" )

-- Check for a value inside the provided table
local function valueInTable( t, valueToFind )
	for k,v in pairs( t ) do
		if v == valueToFind then
			return true
		end
	end
	return false
end

local function facebookListener( event )
	if ( "session" == event.type ) then
		-- Handle login event and try to share the link again if needed
	elseif ( "dialog" == event.type ) then
		-- Handle dialog event
	end
end

local function shareLink( url )
	local accessToken = facebook.getCurrentAccessToken()
	if accessToken == nil then
		facebook.login()
	elseif not valueInTable( accessToken.grantedPermissions, "publish_actions" ) then
		facebook.login( { "publish_actions" } )
	else
		facebook.showDialog( "link", { link=url } )
	end
end

-- Set the "fbconnect" listener from the start
facebook.setFBConnectListener( facebookListener )

-- Sometime later, share a link
shareLink( "https://www.coronalabs.com/" )
``````
