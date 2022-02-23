# facebook.login()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [facebook.*][api.library.facebook]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          facebook
> __See also__          [facebook.logout()][plugin.facebook.logout]
>						[Implementing Facebook][guide.social.usingFacebook]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Prompts the user to login to Facebook. This function can be called even if the user is already logged in. If the user is already logged in but new permissions are requested, the user will be prompted to grant the new permissions. The recommended flow is to request no permissions the first time and then ask for additional permissions as they are needed.


## Gotchas

Please see the [Implementing Facebook][guide.social.usingFacebook] guide for important iOS and <nobr>Android-specific</nobr> notes.


## Syntax

	facebook.login( appId, listener [, permissions ] )

##### appId ~^(required)^~
_[String][api.type.String]._ The Facebook App ID that you receive when you [register](https://developers.facebook.com/apps) your app.

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ A listener that responds to Facebook events. If listener is a table, it should have a property `"fbconnect"` that is a function.

##### permissions ~^(optional)^~
_[Array][api.type.Array]._ An optional array of strings that correspond to Facebook's publishing [permissions](http://developers.facebook.com/docs/authentication/permissions). This enables your application to ask the user to grant certain extended permissions to your app. If not supplied, no extended permissions are requested. Use `"publish_actions"` to allow posting to the user's wall.


## Example

Please see the [Implementing Facebook][guide.social.usingFacebook] guide for code examples and usage details.