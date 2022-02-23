# facebook.getCurrentAccessToken()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, access token, token, getCurrentAccessToken
> __See also__          [facebook.isActive][plugin.facebook-v4.isActive]
>						[facebook.login()][plugin.facebook-v4.login]
>						[facebook.logout()][plugin.facebook-v4.logout]
>						[facebook.*][plugin.facebook-v4]
>						[fbconnect][plugin.facebook-v4.event.fbconnect]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This function replaces the deprecated [facebook.currentAccessToken][plugin.facebook-v4.currentAccessToken] property. It returns the access token (in&nbsp;the form of a <nobr>table of [data](#data))</nobr> used by Facebook to represent the current user.


## Gotchas

* This will return `nil` if nobody is logged in to Facebook.

* The table returned from this function is unreliable unless [facebook.isActive][plugin.facebook-v4.isActive] is `true`.


## Syntax

	facebook.getCurrentAccessToken()


<a id="data"></a>

## Return Value

This function returns a [table][api.type.Table] containing the data provided by a [Facebook User Access Token](https://developers.facebook.com/docs/facebook-login/access-tokens):

* `appId` &mdash; [String][api.type.String] representing the Facebook&nbsp;App&nbsp;ID that you receive when you [register](https://developers.facebook.com/) your app.

* `declinedPermissions` &mdash; [Table][api.type.Table] containing permissions that the user has denied through the app or through Facebook's app settings.

* `expiration` &mdash; [Number][api.type.Number] that corresponds to the date/time when the Facebook login token expires.

* `grantedPermissions` &mdash; [Table][api.type.Table] containing permissions that the user has granted to the app.

* `lastRefreshed` &mdash; [Number][api.type.Number] that corresponds to the last date/time when the Facebook login token was refreshed.

* `token` &mdash; [String][api.type.String] representing the access token used by Facebook to represent the current user.

* `userId` &mdash; [String][api.type.String] representing the ID of the logged in user. This is the same value as the `id` field of <nobr>`facebook.request( "me" )`</nobr>.


## Example

``````lua
local facebook = require( "plugin.facebook.v4" )

local accessToken

if ( facebook.isActive ) then
	accessToken = facebook.getCurrentAccessToken()
	if ( accessToken ) then
		native.showAlert( "Facebook user already logged in", "User's access token: " .. accessToken.token )
	else
		facebook.login()
	end
end
``````
