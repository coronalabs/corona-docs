
# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [fbconnect][plugin.facebook-v4a.event.fbconnect]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, fbconnect, phase
> __See also__          [fbconnect][plugin.facebook-v4a.event.fbconnect]
>						[facebook.login()][plugin.facebook-v4a.login]
>						[facebook.*][plugin.facebook-v4a]
>                       [event.token][plugin.facebook-v4a.event.fbconnect.token]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This property is only present when [event.type][plugin.facebook-v4a.event.fbconnect.type] is `"session"`. It takes on the following values:

* `"login"`
* `"loginFailed"`
* `"loginCancelled"`
* `"logout"`

Note that if the user is already logged in, `event.phase` returns `"login"`. When it is of another type, the property is `nil`.
