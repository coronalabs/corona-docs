# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.inmobi.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, InMobi, adsRequest, phase
> __See also__			[adsRequest][plugin.inmobi.event.adsRequest]
>						[inMobi.*][plugin.inmobi]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.inmobi.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the InMobi plugin was initialized successfully.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.inmobi.event.adsRequest.type] and [event.placementId][plugin.inmobi.event.adsRequest.placementId] can provide additional context.

* `"displayed"` &mdash; Indicates that an ad displayed successfully. For this phase, [event.type][plugin.inmobi.event.adsRequest.type] and [event.placementId][plugin.inmobi.event.adsRequest.placementId] can provide additional context.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.type][plugin.inmobi.event.adsRequest.type] and [event.placementId][plugin.inmobi.event.adsRequest.placementId] can provide additional context.

* `"closed"` &mdash; Indicates that an ad was closed. Applies only to interstitial ads. For this phase, [event.type][plugin.inmobi.event.adsRequest.type] and [event.placementId][plugin.inmobi.event.adsRequest.placementId] can provide additional context.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.inmobi.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.inmobi.event.adsRequest.type], [event.placementId][plugin.inmobi.event.adsRequest.placementId], and [event.response][plugin.inmobi.event.adsRequest.response] can provide additional context.
