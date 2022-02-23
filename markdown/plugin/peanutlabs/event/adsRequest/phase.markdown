# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.peanutlabs.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Peanut Labs, adsRequest, phase
> __See also__			[adsRequest][plugin.peanutlabs.event.adsRequest]
>						[peanutlabs.*][plugin.peanutlabs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.peanutlabs.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Peanut Labs plugin was initialized successfully.

* `"opened"` &mdash; Indicates that a survey displayed successfully. For this phase, [event.type][plugin.peanutlabs.event.adsRequest.type] can provide additional context.

* `"closed"` &mdash; Indicates that a survey was closed. For this phase, [event.type][plugin.peanutlabs.event.adsRequest.type] can provide additional context.
