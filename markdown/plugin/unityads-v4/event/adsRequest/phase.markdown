# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.unityads-v4.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, adsRequest, phase
> __See also__			[adsRequest][plugin.unityads-v4.event.adsRequest]
>						[unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.unityads-v4.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Unity&nbsp;Ads plugin was initialized successfully. You must wait for this event phase before trying to show ads.

* `"loaded"` &mdash; Indicates that an ad has been loaded successfully via [unityads.load()][plugin.unityads-v4.load].

* `"displayed"` &mdash; Indicates that an ad has been displayed successfully via [unityads.show()][plugin.unityads-v4.show].

* `"clicked"` &mdash; Indicates that the user clicked on the ad.

* `"skipped"` &mdash; Indicates that rewarded video playback was stopped by the user before the end of playback. Only applies to rewarded ads.

* `"completed"` &mdash; Indicates that the user viewed the video ad until its completion. For rewarded ads, this means the reward was earned.

* `"failed"` &mdash; Indicates that an ad failed to load or display. For this phase, [event.isError][plugin.unityads-v4.event.adsRequest.isError] will be `true` and [event.response][plugin.unityads-v4.event.adsRequest.response] provides additional context on the error. Additionally, for this phase, [event.data][plugin.unityads-v4.event.adsRequest.data] is a <nobr>JSON-formatted</nobr> string containing `errorCode` and `errorMsg` keys.
