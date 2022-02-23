# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.startapp.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, StartApp, adsRequest, phase
> __See also__			[adsRequest][plugin.startapp.event.adsRequest]
>						[startapp.*][plugin.startapp]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.startapp.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the StartApp plugin was initialized successfully.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, event.isError will be true. Additionally, event.type and event.response can provide additional context.

* `"loaded"` &mdash; Indicates that an ad loaded successfully via startapp.load(). For this phase, [event.type][plugin.startapp.event.adsRequest.type] can provide additional context.

* `"displayed"` &mdash; Indicates that an ad was displayed successfully via startapp.show(). For this phase, [event.type][plugin.startapp.event.adsRequest.type] can provide additional context.

* `"hidden"` &mdash; Indicates that an ad was closed/hidden. For this phase, [event.type][plugin.startapp.event.adsRequest.type] can provide additional context.

* `"reward"` &mdash; Indicates that a rewarded video ad has been viewed to its completion and that a reward should be given.

* `"clicked"` &mdash; Indicates that an ad was clicked/tapped. For this phase, [event.type][plugin.startapp.event.adsRequest.type] can provide additional context.
