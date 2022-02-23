# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [analyticsRequest][plugin.kochava-app-analytics.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava Free App Analytics, analyticsRequest, phase
> __See also__			[analyticsRequest][plugin.kochava-app-analytics.event.analyticsRequest]
>						[kochavaFAA.*][plugin.kochava-app-analytics]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] indicating the phase of the [analyticsRequest][plugin.kochava-app-analytics.event.analyticsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Kochava plugin was initialized successfully. For this phase, the [event.data][plugin.kochava-app-analytics.event.analyticsRequest.data] property provides information about the Kochava device&nbsp;ID.

* `"recorded"` &mdash; Indicates that an event was successfully recorded via [kochavaFAA.logEvent()][plugin.kochava-app-analytics.logEvent]

* `"received"` &mdash; Indicates that attribution data was received <nobr>(see [kochavaFAA.getAttributionData()][plugin.kochava-app-analytics.getAttributionData])</nobr>. For this phase, the [event.data][plugin.kochava-app-analytics.event.analyticsRequest.data] property provides context on the received event.

* `"failed"` &mdash; Indicates that an error has occurred. For this phase, [event.type][plugin.kidoz.event.adsRequest.type] and [event.data][plugin.kidoz.event.adsRequest.data] can provide additional context.
