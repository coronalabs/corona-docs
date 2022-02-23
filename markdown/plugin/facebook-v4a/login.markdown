# facebook.login()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, login
> __See also__          [facebook.logout()][plugin.facebook-v4a.logout]
>						[facebook.*][plugin.facebook-v4a]
>						[fbconnect][plugin.facebook-v4a.event.fbconnect]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Prompts the user to log in to Facebook. This function can be called even if the user is already logged in. If the user is already logged in but new permissions are requested, the user will be prompted to grant the new permissions. The recommended flow is to request no permissions the first time and then ask for additional permissions as they are needed.

The login comes back in the form of a [fbconnect][plugin.facebook-v4a.event.fbconnect] event that is sent to the listener specified within [facebook.init()][plugin.facebook-v4a.init], [facebook.setFBConnectListener()][plugin.facebook-v4a.setFBConnectListener], or this function itself.

<div class="docs-tip-outer docs-tip-color-alert">
<div class="docs-tip-inner-left">
<div class="fa fa-exclamation-circle" style="font-size: 35px;"></div>
</div>
<div class="docs-tip-inner-right">

We strongly recommended that you call [facebook.init()][plugin.facebook-v4a.init] and wait for initialization to complete __before__ making this API call. See code below for an example implementation.

</div>
</div>


## Syntax

	facebook.login( [listener] [, permissions], [, limitedLogin] )

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ A listener that responds to [fbconnect][plugin.facebook-v4a.event.fbconnect] events. If the listener is a table, it should have a property `"fbconnect"` that is a function.

##### permissions ~^(optional)^~
_[Array][api.type.Array]._ An optional array of strings that correspond to Facebook's publishing [permissions](https://developers.facebook.com/docs/facebook-login/permissions/v2.4#reference). This enables your application to ask the user to grant certain extended permissions to your app. If not supplied, no extended permissions are requested. Use `"publish_actions"` to allow posting to the user's wall. For developer convenience, required permissions such as `"public_profile"` ([reference](https://developers.facebook.com/docs/facebook-login/permissions#reference-public_profile)) and `"user_friends"` ([reference](https://developers.facebook.com/docs/facebook-login/permissions#reference-user_friends)) will be automatically requested if needed.

##### limitedLogin ~^(optional)^~
_[Boolean][api.type.Boolean]._ default is false, using Limited Login with the app will not be used to personalize or measure advertising effectiveness. Android does not support FB Limited Login.

## Gotchas

* Both <nobr>__read-only__</nobr> and __publishable__ permissions can be specified, but requesting both of these permission types in the same `facebook.login()` call is __not__ allowed&nbsp;&mdash; if you attempt to do this, only the <nobr>read-only</nobr> permissions will be requested, for&nbsp;instance:

<div class="code-indent">

``````lua
-- This call will only request "user_events" as it's a read-only permission
facebook.login( { "user_events", "public_actions" } )
``````

</div>

* If your app has a state where it may need to request both <nobr>read-only</nobr> and publishable permissions around the same time, you'll need to perform this as two seperate `facebook.login()` calls, for instance:

<div class="code-indent">

``````{ brush="lua" gutter="false" first-line="1" highlight="[26,41]" }
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

local function genericFacebookLogin( event )
	print( event )
end

-- This listener will handle the request of read-only permissions, then request publishable permissions
local function intermediateFacebookLogin( event )

	if ( "session" == event.type ) then
		if ( "login" == event.phase ) then
			local accessToken = facebook.getCurrentAccessToken()

			-- Continue only if the user granted the read-only permissions
			if ( valueInTable( accessToken.grantedPermissions, "user_events" ) ) then
				facebook.login( genericFacebookLogin, { "publish_actions" } )
			else
				print( "The user did not grant the read-only permissions" )
			end
		end
	end
end

local function facebookListener( event )

	if ( "fbinit" == event.name ) then

		print( "Facebook initialized" )

		-- Request read-only permissions, followed by publishable permissions
		facebook.login( intermediateFacebookLogin, { "user_events" } )
	end
end

-- Set the "fbinit" listener to be triggered when initialization is complete
facebook.init( facebookListener )
``````

</div>
