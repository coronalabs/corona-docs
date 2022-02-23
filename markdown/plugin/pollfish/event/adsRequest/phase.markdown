# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.pollfish.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Pollfish, adsRequest, phase
> __See also__			[adsRequest][plugin.pollfish.event.adsRequest]
>						[pollfish.*][plugin.pollfish]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.pollfish.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Pollfish plugin was initialized successfully.

* `"displayed"` &mdash; Indicates that a survey was displayed. 

* `"closed"` &mdash; Indicates that a survey was closed. 

* `"loaded"` &mdash; Indicates that a survey was loaded and is ready for display. For this phase, [event.data][plugin.pollfish.event.adsRequest.data] provides additional context.

* `"completed"` &mdash; Indicates that a survey was completed. For this phase, [event.data][plugin.pollfish.event.adsRequest.data] provides additional context.

* `"failed"` &mdash; Indicates that an error occurred. For this phase, [event.response][plugin.pollfish.event.adsRequest.response] provides additional context.
