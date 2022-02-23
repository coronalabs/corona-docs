# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.fuse.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, adsRequest, type
> __See also__			[adsRequest][plugin.fuse.event.adsRequest]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

When the [event.phase][plugin.fuse.event.adsRequest.phase] is `"init"`, `"loaded"`, or `"shown"`, this property specifies the ad type associated with the zone, for example `"interstitial"`.

When the [event.phase][plugin.fuse.event.adsRequest.phase] is `"completed"`, this property specifies the type of action completed:

* `"rewarded"` &mdash; The user has completed watching a video and should be given a reward such as <nobr>in-app</nobr> currency.
* `"iapOffer"` &mdash; The user has accepted an IAP (<nobr>in-app</nobr> purchase) offer.
* `"virtualGoodsOffer"` &mdash; The user has accepted a virtual goods offer.
