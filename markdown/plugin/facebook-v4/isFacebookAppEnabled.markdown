# facebook.isFacebookAppEnabled

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Facebook, isFacebookAppEnabled
> __See also__          [facebook.*][plugin.facebook-v4]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Determines if a Facebook app is installed and accessible on the device. Some behaviors of the Facebook plugin differ depending on whether a Facebook&nbsp;app is installed or not. Using this API can help optimize the user experience depending on this factor.

This function returns `true` if a Facebook app is installed and accessible on the device, with the following caveats:

* On iOS, this function is equivalent to `system.canOpenURL("fb://")`. Because of this, the same gotchas for [system.canOpenURL()][api.library.system.canOpenURL#gotchas] apply.

* On Android, this function will return `true` for either the standard [Facebook app](https://play.google.com/store/apps/details?id=com.facebook.katana&hl=en) or the [Facebook Lite app](https://play.google.com/store/apps/details?id=com.facebook.lite&hl=en).


## Syntax

	facebook.isFacebookAppEnabled()
