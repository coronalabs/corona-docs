# facebook.logout()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Event][api.type.Event]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, logout
> __See also__          [facebook.login()][plugin.facebook-v4.login]
>						[facebook.*][plugin.facebook-v4]
>						[fbconnect][plugin.facebook-v4.event.fbconnect]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Logs the application out of the user's Facebook session.

This logout comes back in the form of a [fbconnect][plugin.facebook-v4.event.fbconnect] event that is sent to the listener specified within [facebook.setFBConnectListener()][plugin.facebook-v4.setFBConnectListener] or [facebook.login()][plugin.facebook-v4.login].


## Gotchas

This does __not__ log the device's user out of Facebook entirely. If the user is logged into Facebook through a native Facebook app or the device's browser, they will remain logged in via those means.


## Syntax

	facebook.logout()
