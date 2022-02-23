
# event.token

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [fbconnect][plugin.facebook-v4a.event.fbconnect]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, fbconnect, token
> __See also__          [fbconnect][plugin.facebook-v4a.event.fbconnect]
>						[facebook.login()][plugin.facebook-v4a.login]
>						[facebook.*][plugin.facebook-v4a]
>                       [event.phase][plugin.facebook-v4a.event.fbconnect.phase]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

This is the access token needed for certain Facebook API calls. It is only present when the [event.phase][plugin.facebook-v4a.event.fbconnect.phase] is `"login"` (`nil`&nbsp;otherwise).
