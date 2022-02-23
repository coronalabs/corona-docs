# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.adcolony.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdColony, adsRequest, phase
> __See also__			[adsRequest][plugin.adcolony.event.adsRequest]
>						[adcolony.*][plugin.adcolony]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.adcolony.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the AdColony plugin was initialized successfully. You must wait for this event phase before trying to load or show ads.

* `"displayed"` &mdash; Indicates that an ad was displayed. For this phase, [event.data][plugin.adcolony.event.adsRequest.data] is a <nobr>JSON-encoded</nobr> string containing more information about the ad that was displayed.

* `"closed"` &mdash; Indicates that an ad was closed. For this phase, [event.data][plugin.adcolony.event.adsRequest.data] is a <nobr>JSON-encoded</nobr> string containing more information about the ad that was closed.
            
* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.data][plugin.adcolony.event.adsRequest.data] is a <nobr>JSON-encoded</nobr> string containing more information about the ad that was loaded.

* `"reward"` &mdash; Applies only to rewarded video ads <nobr>([event.type][plugin.adcolony.event.adsRequest.type] of `"rewardedVideo"`)</nobr>. Indicates that a video ad was viewed to completion. For this phase, [event.data][plugin.adcolony.event.adsRequest.data] is a <nobr>JSON-encoded</nobr> string containing more information about the reward.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.data][plugin.adcolony.event.adsRequest.data] is a <nobr>JSON-encoded</nobr> string containing more information about the error.

* `"clicked"` &mdash; Indicates that an ad was clicked. For this phase, [event.data][plugin.adcolony.event.adsRequest.data] is a <nobr>JSON-encoded</nobr> string containing more information about the ad that was clicked.

* `"expired"` &mdash; Indicates that a previously-loaded ad has expired and that a new ad should be loaded. For this phase, [event.data][plugin.adcolony.event.adsRequest.data] is a <nobr>JSON-encoded</nobr> string containing more information about the ad that expired.

* `"info"` &mdash; Indicates that information for the zone was successfully retrieved via a call to [adcolony.getInfoForZone()][plugin.adcolony.getInfoForZone]. For this phase, [event.data][plugin.adcolony.event.adsRequest.data] is a <nobr>JSON-encoded</nobr> string containing additional information about the zone.
