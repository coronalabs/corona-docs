# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.appodeal.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, adsRequest, phase
> __See also__			[adsRequest][plugin.appodeal.event.adsRequest]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.appodeal.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Appodeal plugin was initialized successfully.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.appodeal.event.adsRequest.type] can provide additional context.

* `"displayed"` &mdash; Indicates that an ad displayed successfully. For this phase, [event.type][plugin.appodeal.event.adsRequest.type] can provide additional context.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.type][plugin.appodeal.event.adsRequest.type] can provide additional context. Please note that this event is not available for video or rewarded video ads.

* `"closed"` &mdash; Indicates that an ad was closed. Applies only to static interstitial and video ads. For this phase, [event.type][plugin.appodeal.event.adsRequest.type] can provide additional context.

* `"hidden"` &mdash; Indicates that a banner ad was hidden. For this phase, [event.type][plugin.appodeal.event.adsRequest.type] can provide additional context.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.appodeal.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.appodeal.event.adsRequest.type] and [event.response][plugin.appodeal.event.adsRequest.response] can provide additional context.

* `"playbackBegan"` &mdash; Indicates that a video ad playback has begun. For this phase, [event.type][plugin.appodeal.event.adsRequest.type] can provide additional context.

* `"playbackEnded"` &mdash; Indicates that a video ad playback has ended. For this phase, [event.type][plugin.appodeal.event.adsRequest.type] can provide additional context.

* `"dataReceived"` &mdash; Indicates that event data has been received. For this phase, [event.data][plugin.appodeal.event.adsRequest.data] will provide additional context.
