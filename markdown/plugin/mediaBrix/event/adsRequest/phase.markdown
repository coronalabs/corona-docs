# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.mediaBrix.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, MediaBrix, adsRequest, phase
> __See also__			[adsRequest][plugin.mediaBrix.event.adsRequest]
>						[mediaBrix.*][plugin.mediaBrix]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.mediaBrix.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the MediaBrix plugin was initialized successfully.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.mediaBrix.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.mediaBrix.event.adsRequest.type], [event.placementId][plugin.mediaBrix.event.adsRequest.placementId], and [event.response][plugin.mediaBrix.event.adsRequest.response] can provide additional context.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.mediaBrix.event.adsRequest.type] and [event.placementId][plugin.mediaBrix.event.adsRequest.placementId] can provide additional context.

* `"reward"` &mdash; Indicates that a rewarded ad was viewed to completion. When this event phase is triggered, you may reward your user with, for instance, <nobr>in-game</nobr> virtual currency or some other bonus.

* `"displayed"` &mdash; Indicates that an ad was displayed. For this phase, [event.type][plugin.mediaBrix.event.adsRequest.type] and [event.placementId][plugin.mediaBrix.event.adsRequest.placementId] can provide additional context.

* `"closed"` &mdash; Indicates that an ad was closed. For this phase, [event.type][plugin.mediaBrix.event.adsRequest.type] and [event.placementId][plugin.mediaBrix.event.adsRequest.placementId] can provide additional context.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.type][plugin.mediaBrix.event.adsRequest.type] and [event.placementId][plugin.mediaBrix.event.adsRequest.placementId] can provide additional context.
