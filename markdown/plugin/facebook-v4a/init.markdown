# facebook.init

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, init
> __See also__          [facebook.login()][plugin.facebook-v4a.login]
>						[facebook.*][plugin.facebook-v4a]
>						[fbconnect][plugin.facebook-v4a.event.fbconnect]
>						[fbinit][plugin.facebook-v4a.event.fbinit]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the listener function which will receive a [fbinit][plugin.facebook-v4a.event.fbinit] event once initialization of the Facebook&nbsp;SDK is complete.

This method also sets the same listener function as the default listener for [fbconnect][plugin.facebook-v4a.event.fbconnect] events, so there's no need to call [facebook.setFBConnectListener()][plugin.facebook-v4a.setFBConnectListener] unless you want to use a different listener for [fbconnect][plugin.facebook-v4a.event.fbconnect] events versus the [fbinit][plugin.facebook-v4a.event.fbinit] event.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

Initialization of the Facebook&nbsp;SDK is automatically triggered when the plugin is required. This call provides a way to determine __when__ initialization is complete. We strongly recommended that you wait for initialization to complete __before__ making calls like [facebook.login()][plugin.facebook-v4a.login] or [facebook.publishInstall()][plugin.facebook-v4a.publishInstall].

</div>


## Syntax

	facebook.init( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ A listener that responds to [fbinit][plugin.facebook-v4a.event.fbinit] events and, optionally, [fbconnect][plugin.facebook-v4a.event.fbconnect] events. If this is a table, it should have a property `"fbinit"` that is a function.


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

local function facebookListener( event )

	if ( "fbinit" == event.name ) then

		print( "Facebook initialized" )

		-- Initialization complete; share a link
		shareLink( "https://www.coronalabs.com/" )

	elseif ( "fbconnect" == event.name ) then

		if ( "session" == event.type ) then
			-- Handle login event and try to share the link again if needed
		elseif ( "dialog" == event.type ) then
			-- Handle dialog event
		end
	end
end

-- Set the "fbinit" listener to be triggered when initialization is complete
facebook.init( facebookListener )
``````
