# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics, analyticsRequest, phase
> __See also__			[analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]
>						[flurryAnalytics.*][plugin.flurry-analytics]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] indicating the phase of the [analyticsRequest][plugin.flurry-analytics.event.analyticsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Flurry plugin was initialized successfully. You must wait for this event phase before trying to log analytics events or start timed events. For this phase, the `event` property of [event.data][plugin.flurry-analytics.event.analyticsRequest.data] provides information about the session&nbsp;ID.

* `"recorded"` &mdash; Indicates that an event was successfully recorded ([flurryAnalytics.logEvent()][plugin.flurry-analytics.logEvent]). For this phase, the `event` property of [event.data][plugin.flurry-analytics.event.analyticsRequest.data] provides context on the logged event.

* `"began"` &mdash; Indicates that a timed event was successfully started ([flurryAnalytics.startTimedEvent()][plugin.flurry-analytics.startTimedEvent]). For this phase, the `event` property of [event.data][plugin.flurry-analytics.event.analyticsRequest.data] provides context on the logged event.
            
* `"ended"` &mdash; Indicates that a timed event was successfully ended ([flurryAnalytics.endTimedEvent()][plugin.flurry-analytics.endTimedEvent]). For this phase, the `event` property of [event.data][plugin.flurry-analytics.event.analyticsRequest.data] provides context on the logged event.

* `"failed"` &mdash; Indicates that an event was not recorded. For this phase, [event.isError][plugin.flurry-analytics.event.analyticsRequest.isError] will be `true` and [event.response][plugin.flurry-analytics.event.analyticsRequest.response] provides additional context on the error. In addition, [event.data][plugin.flurry-analytics.event.analyticsRequest.data] provides more detailed information about the error.
