# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.applovinMax.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, Applovin Max, adsRequest, phase
> __See also__			[adsRequest][plugin.applovinMax.event.adsRequest]
>						[applovinMax.*][plugin.applovinMax]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.applovinMax.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the AppLovin plugin was initialized successfully.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.applovinMax.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.applovinMax.event.adsRequest.type] and [event.response][plugin.applovinMax.event.adsRequest.response] can provide additional context.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] can provide additional context.

* `"displayed"` &mdash; Indicates that an ad was displayed. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] can provide additional context.

* `"expanded"` &mdash; Applies only to banner ads. Indicates that an ad was expanded. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] can provide additional context.

* `"collapsed"` &mdash; Applies only to banner ads. Indicates that an ad was collapsed. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] can provide additional context.

* `"hidden"` &mdash; Indicates that an interstitial ad was closed/hidden. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] can provide additional context.

* `"playbackBegan"` &mdash; Indicates that a video ad has started playback. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] can provide additional context.

* `"playbackEnded"` &mdash; Indicates that a video ad has ended playback. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] and [event.data][plugin.applovin.event.adsRequest.data] can provide additional context.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] can provide additional context.

* `"declinedToView"` &mdash; Applies only to rewarded video ads. Indicates that the user chose "no" when prompted to view the ad. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] can provide additional context.

* `"userReceivedReward"` &mdash; Applies only to rewarded video ads. Indicates that the user viewed the ad and that their reward was approved by the AppLovin server. For this phase, [event.type][plugin.applovinMax.event.adsRequest.type] and [event.data][plugin.applovinMax.event.adsRequest.data] can provide additional context.
