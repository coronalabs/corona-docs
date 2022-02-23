
# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [fbconnect][plugin.facebook-v4a.event.fbconnect]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, fbconnect, type
> __See also__			[fbconnect][plugin.facebook-v4a.event.fbconnect]
>						[facebook.*][plugin.facebook-v4a]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property determines what type of [fbconnect][plugin.facebook-v4a.event.fbconnect] event is happening. It takes on the following values depending on the action:

* `"session"` in response to [facebook.login()][plugin.facebook-v4a.login] or [facebook.logout()][plugin.facebook-v4a.logout].
* `"request"` in response to [facebook.request()][plugin.facebook-v4a.request].
* `"dialog"` in response to [facebook.showDialog()][plugin.facebook-v4a.showDialog].
