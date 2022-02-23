# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.supersonic.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Supersonic, adsRequest, phase
> __See also__			[adsRequest][plugin.supersonic.event.adsRequest]
>						[supersonic.*][plugin.supersonic]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.supersonic.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Supersonic plugin was initialized successfully.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.supersonic.event.adsRequest.type] can provide additional context.

* `"displayed"` &mdash; Indicates that an ad displayed successfully. For this phase, [event.type][plugin.supersonic.event.adsRequest.type] can provide additional context.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase [event.type][plugin.supersonic.event.adsRequest.type] can provide additional context.

* `"closed"` &mdash; Indicates that an ad was closed. For this phase, [event.type][plugin.supersonic.event.adsRequest.type] can provide additional context.

* `"rewarded"` &mdash; Indicates that a reward for an offer or rewarded video was given. For this phase, [event.type][plugin.supersonic.event.adsRequest.type] and [event.response][plugin.supersonic.event.adsRequest.response] can provide additional context.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.supersonic.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.supersonic.event.adsRequest.type] and [event.response][plugin.supersonic.event.adsRequest.response] can provide additional context.
