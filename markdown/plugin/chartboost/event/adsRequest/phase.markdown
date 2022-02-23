# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.chartboost.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, adsRequest, phase
> __See also__			[adsRequest][plugin.chartboost.event.adsRequest]
>						[chartboost.*][plugin.chartboost]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.chartboost.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Chartboost plugin was initialized successfully. You must wait for this event phase before trying to show/load ads.

* `"displayed"` &mdash; Indicates that an ad was displayed. For this phase, [event.data][plugin.chartboost.event.adsRequest.data] is a JSON string containing the ad `location`.

* `"closed"` &mdash; Indicates that an ad was closed/hidden. For this phase, [event.data][plugin.chartboost.event.adsRequest.data] is a JSON string containing the ad `location`.
            
* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.data][plugin.chartboost.event.adsRequest.data] is a JSON string containing the ad `location`.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.data][plugin.chartboost.event.adsRequest.data] is a JSON string containing the ad `location`.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.chartboost.event.adsRequest.isError] will be `true` and [event.response][plugin.chartboost.event.adsRequest.response] provides additional context on the error. For this phase, [event.data][plugin.chartboost.event.adsRequest.data] is a JSON string containing the ad `location`, `errorCode` and `errorMsg`.

* `"reward"` &mdash; Applies only to rewarded video ads <nobr>([event.type][plugin.chartboost.event.adsRequest.type] of `"rewardedVideo"`)</nobr>. Indicates that a video ad was viewed to completion. For this phase, [event.data][plugin.chartboost.event.adsRequest.data] is a JSON string containing the ad `location` and `reward` amount.
