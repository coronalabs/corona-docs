# facebook.setFBConnectListener

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, setFBConnectListener
> __See also__          [facebook.login()][plugin.facebook-v4a.login]
>						[facebook.*][plugin.facebook-v4a]
>						[fbconnect][plugin.facebook-v4a.event.fbconnect]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the listener function which will receive [fbconnect][plugin.facebook-v4a.event.fbconnect] events. This method can be used when the listener needs to change but there's no need for a [facebook.login()][plugin.facebook-v4a.login], [facebook.request()][plugin.facebook-v4a.request], or [facebook.showDialog()][plugin.facebook-v4a.showDialog] call.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

The default listener is the one supplied to [facebook.init()][plugin.facebook-v4a.init], so using this API is not mandatory.

</div>


## Syntax

	facebook.setFBConnectListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ A listener that responds to [fbconnect][plugin.facebook-v4a.event.fbconnect] events. If this is a table, it should have a property `"fbconnect"` that is a function.


## Example

``````lua
local facebook = require( "plugin.facebook.v4a" )

-- Check for a value inside the provided table
local function valueInTable( t, valueToFind )
	for k,v in pairs( t ) do
		if v == valueToFind then
			return true
		end
	end
	return false
end

local function facebookConnectListener( event )
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

local function facebookInitListener( event )

	print( "Facebook initialized" )

	-- Initialization complete; share a link
	shareLink( "https://www.coronalabs.com/" )
end

-- Set the "fbconnect" listener 
facebook.setFBConnectListener( facebookConnectListener )

-- Set the "fbinit" listener to be triggered when initialization is complete
facebook.init( facebookInitListener )
``````
