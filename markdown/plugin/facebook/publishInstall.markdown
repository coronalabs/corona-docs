# facebook.publishInstall()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [facebook.*][api.library.facebook]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          facebook
> __See also__          [Implementing Facebook][guide.social.usingFacebook]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sends a message to the Facebook server indicating that the app has been installed. After a single successful connection to the Facebook server, it will not try again on subsequent calls. For more information, see the [Implementing Facebook][guide.social.usingFacebook] guide.


## Gotchas

Please see the [Implementing Facebook][guide.social.usingFacebook] guide for important iOS and <nobr>Android-specific</nobr> notes.


## Syntax

	facebook.publishInstall( appId )

##### appId ~^(required)^~
_[String][api.type.String]._ The Facebook App ID that you receive when you [register](https://developers.facebook.com/apps) your app.