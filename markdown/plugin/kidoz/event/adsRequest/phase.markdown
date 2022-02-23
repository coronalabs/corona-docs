# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.kidoz.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, KIDOZ, adsRequest, phase
> __See also__			[adsRequest][plugin.kidoz.event.adsRequest]
>						[kidoz.*][plugin.kidoz]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.kidoz.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the KIDOZ plugin was initialized successfully.

* `"failed"` &mdash; Indicates that an ad failed to load or that the plugin failed to initialize. When an ad fails to load, [event.type][plugin.kidoz.event.adsRequest.type] can provide additional context. When the plugin fails to initialize [event.response][plugin.kidoz.event.adsRequest.response] can provide additional context.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.kidoz.event.adsRequest.type] can provide additional context.

* `"displayed"` &mdash; Indicates that an ad was displayed. For this phase, [event.type][plugin.kidoz.event.adsRequest.type] can provide additional context.

* `"closed"` &mdash; Indicates that an ad was closed. For this phase, [event.type][plugin.kidoz.event.adsRequest.type] can provide additional context.

* `"reward"` &mdash; Indicates that a rewarded video has completed. For this phase, [event.type][plugin.kidoz.event.adsRequest.type] will be `"rewardedVideo"`.

* `"playbackBegan"` &mdash; Indicates that a rewarded video has began playback. For this phase, [event.type][plugin.kidoz.event.adsRequest.type] will be `"rewardedVideo"`.
