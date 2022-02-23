# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.fbAudienceNetwork.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Facebook Audience Network, fbAudienceNetwork, adsRequest, phase
> __See also__			[adsRequest][plugin.fbAudienceNetwork.event.adsRequest]
>						[fbAudienceNetwork.*][plugin.fbAudienceNetwork]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.fbAudienceNetwork.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Facebook Audience Network was initialized successfully.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.fbAudienceNetwork.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.fbAudienceNetwork.event.adsRequest.type], [event.placementId][plugin.fbAudienceNetwork.event.adsRequest.placementId], and [event.response][plugin.fbAudienceNetwork.event.adsRequest.response] can provide additional context.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.fbAudienceNetwork.event.adsRequest.type] and [event.placementId][plugin.fbAudienceNetwork.event.adsRequest.placementId] can provide additional context.

* `"refreshed"` &mdash; Indicates that a banner ad was refreshed. For this phase, [event.placementId][plugin.fbAudienceNetwork.event.adsRequest.placementId] can provide additional context.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.type][plugin.fbAudienceNetwork.event.adsRequest.type] and [event.placementId][plugin.fbAudienceNetwork.event.adsRequest.placementId] can provide additional context.

* `"closed"` &mdash; Indicates that an ad was closed. Applies only to interstitial ads. For this phase, [event.placementId][plugin.fbAudienceNetwork.event.adsRequest.placementId] can provide additional context.

* `"reward"` &mdash; Indicates that a rewarded video ad has been viewed to its completion and that a reward should be given.
