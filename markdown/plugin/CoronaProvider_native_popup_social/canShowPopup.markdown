# native.canShowPopup() — Social Popup

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [native.*][api.library.native]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          native, canShowPopup, social, Twitter, Facebook, Sina Weibo
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns whether or not the popup type can be shown. On iOS, this means that the service has been set up on the device (for&nbsp;example, Twitter has been configured via the __Settings__&nbsp;app). On Android, this means that the service has been installed on the device.


## Syntax

	native.canShowPopup( name, service )

##### name ~^(required)^~
_[String][api.type.String]._ The string name of the popup to be shown. For the Social Popup plugin, use `"social"`.

##### service ~^(required)^~
_[String][api.type.String]._

* On iOS, this is the name of the social service popup to show. Supported values are `"twitter"`, `"facebook"`, or `"sinaWeibo"`.

* On Android, this is the package name of the social service you wish to check is installed on the device. For example, if you set this to `"twitter"`, this function will check to see if any package names installed on the device contain the string `twitter` and, if a match is found, it will return `true`. If you don't care about checking for a specific service, and simply want to check if at least one is available, set this to `"share"`.