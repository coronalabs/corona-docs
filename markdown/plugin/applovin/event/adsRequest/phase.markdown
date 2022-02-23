# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.applovin.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, adsRequest, phase
> __See also__			[adsRequest][plugin.applovin.event.adsRequest]
>						[applovin.*][plugin.applovin]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.applovin.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the AppLovin plugin was initialized successfully.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.applovin.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.applovin.event.adsRequest.type] and [event.response][plugin.applovin.event.adsRequest.response] can provide additional context.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.applovin.event.adsRequest.type] can provide additional context.

* `"displayed"` &mdash; Indicates that an ad was displayed. For this phase, [event.type][plugin.applovin.event.adsRequest.type] can provide additional context.

* `"hidden"` &mdash; Indicates that an interstitial ad was closed/hidden. For this phase, [event.type][plugin.applovin.event.adsRequest.type] can provide additional context.

* `"playbackBegan"` &mdash; Indicates that a video ad has started playback. For this phase, [event.type][plugin.applovin.event.adsRequest.type] can provide additional context. 

* `"playbackEnded"` &mdash; Indicates that a video ad has ended playback. For this phase, [event.type][plugin.applovin.event.adsRequest.type] and [event.data][plugin.applovin.event.adsRequest.data] can provide additional context. 

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.type][plugin.applovin.event.adsRequest.type] can provide additional context.

* `"declinedToView"` &mdash; Applies only to rewarded video ads. Indicates that the user chose "no" when prompted to view the ad. For this phase, [event.type][plugin.applovin.event.adsRequest.type] can provide additional context.

* `"validationSucceeded"` &mdash; Applies only to rewarded video ads. Indicates that the user viewed the ad and that their reward was approved by the AppLovin server. For this phase, [event.type][plugin.applovin.event.adsRequest.type] and [event.data][plugin.applovin.event.adsRequest.data] can provide additional context.

* `"validationExceededQuota"` &mdash; Applies only to rewarded video ads. Indicates that the AppLovin server was contacted, but the user has already received the maximum amount of rewarded video offers allowed in a given day, defined by "frequency&nbsp;capping" in the [AppLovin developer portal](https://www.applovin.com/manage). For this phase, [event.type][plugin.applovin.event.adsRequest.type] and [event.data][plugin.applovin.event.adsRequest.data] can provide additional context.

* `"validationRejected"` &mdash; Applies only to rewarded video ads. Indicates that the AppLovin server rejected the reward request. For this phase, [event.type][plugin.applovin.event.adsRequest.type] and [event.data][plugin.applovin.event.adsRequest.data] can provide additional context.

* `"validationFailed"` &mdash; Applies only to rewarded video ads. Indicates that the AppLovin server could not be contacted. For this phase, [event.type][plugin.applovin.event.adsRequest.type] and [event.data][plugin.applovin.event.adsRequest.data] can provide additional context.
