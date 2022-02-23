# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.superawesome.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, SuperAwesome, adsRequest, phase
> __See also__			[adsRequest][plugin.superawesome.event.adsRequest]
>						[superawesome.*][plugin.superawesome]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.superawesome.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the SuperAwesome plugin was initialized successfully.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.superawesome.event.adsRequest.type] and [event.placementId][plugin.superawesome.event.adsRequest.placementId] can provide additional context.

* `"displayed"` &mdash; Indicates that an ad displayed successfully. For this phase, [event.type][plugin.superawesome.event.adsRequest.type] and [event.placementId][plugin.superawesome.event.adsRequest.placementId] can provide additional context.

* `"refreshed"` &mdash; Indicates that a banner space has been updated with a new ad. For this phase, [event.placementId][plugin.superawesome.event.adsRequest.placementId] can provide additional context.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.type][plugin.superawesome.event.adsRequest.type] and [event.placementId][plugin.superawesome.event.adsRequest.placementId] can provide additional context.

* `"closed"` &mdash; Indicates that an ad was closed. Applies only to interstitial and video ads. For this phase, [event.type][plugin.superawesome.event.adsRequest.type] and [event.placementId][plugin.superawesome.event.adsRequest.placementId] can provide additional context.

* `"hidden"` &mdash; Indicates that a banner ad was hidden. For this phase, [event.placementId][plugin.superawesome.event.adsRequest.placementId] can provide additional context.

* `"playbackEnded"` &mdash; Indicates that a video ad has played to its completion. For this phase, [event.placementId][plugin.superawesome.event.adsRequest.placementId] can provide additional context.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.superawesome.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.superawesome.event.adsRequest.type], [event.placementId][plugin.superawesome.event.adsRequest.placementId], and [event.response][plugin.superawesome.event.adsRequest.response] can provide additional context.
