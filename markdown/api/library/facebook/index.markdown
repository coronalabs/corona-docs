# facebook.*

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Library][api.type.Library]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          facebook
> __See also__          [Facebook Portal Setup][guide.social.setupFacebook] _(guide)_
>						[Implementing Facebook][guide.social.usingFacebook] _(guide)_
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The `facebook` library provides access to Facebook Connect, a set of web APIs for accessing the Facebook social network. The functions allow a user to login/logout, post messages/images, and retrieve status.

For implementation details, please see the Facebook [plugin documentation][plugin.facebook].


## Gotchas

* You must ensure your app works properly with <nobr>single-sign-on</nobr> (SSO). Please read the [Facebook Portal Setup][guide.social.setupFacebook] guide for more information on how to implement <nobr>single-sign-on</nobr> in your <nobr>Facebook-enabled</nobr> apps.

* The APIs in this library do nothing in the Corona Simulator. They are only functional on iOS and Android devices, as well as the Xcode iOS Simulator.