# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.vungle-v6.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle, adsRequest, phase
> __See also__			[adsRequest][plugin.vungle-v6.event.adsRequest]
>						[supersonic.*][plugin.vungle-v6]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.vungle-v6.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Vungle plugin was initialized successfully.

* `"loaded"` &mdash; Indicates that an ad loaded successfully.

* `"displayed"` &mdash; Indicates that an ad displayed successfully.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped.

* `"completed"` &mdash; Indicates that a ad was completed/ended.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.vungle-v6.event.adsRequest.isError] will be `true`. Additionally, [[event.response][plugin.vungle-v6.event.adsRequest.response] can provide additional context.
