# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.admob.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, adsRequest, phase
> __See also__			[adsRequest][plugin.admob.event.adsRequest]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.admob.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the AdMob plugin was initialized successfully. You must wait for this event phase before trying to load/show ads.

* `"loaded"` &mdash; Indicates that an ad has been loaded successfully via [admob.load()][plugin.admob.load].

* `"displayed"` &mdash; Indicates that an ad has been displayed successfully via [admob.show()][plugin.admob.show].

* `"refreshed"` &mdash; Indicates that a banner ad has been updated with a new ad.

* `"reward"` &mdash; Indicates that a rewarded video ad has been viewed to its completion and that a reward should be given. Additionally, for this phase, [event.data][plugin.admob.event.adsRequest.data] is a <nobr>JSON-formatted</nobr> string containing `rewardItem` and `rewardAmount` keys.

* `"hidden"` &mdash; Indicates that a banner ad has been hidden.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped.

* `"closed"` &mdash; Indicates that an interstitial ad was closed.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.admob.event.adsRequest.isError] will be `true` and [event.response][plugin.admob.event.adsRequest.response] provides additional context on the error. Additionally, for this phase, [event.data][plugin.admob.event.adsRequest.data] is a <nobr>JSON-formatted</nobr> string containing `errorCode` and `errorMsg` keys.
