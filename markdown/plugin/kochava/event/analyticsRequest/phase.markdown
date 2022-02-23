# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [analyticsRequest][plugin.kochava.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava, analyticsRequest, phase
> __See also__			[analyticsRequest][plugin.kochava.event.analyticsRequest]
>						[kochava.*][plugin.kochava]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] indicating the phase of the [analyticsRequest][plugin.kochava.event.analyticsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Kochava plugin was initialized successfully. For this phase, the [event.data][plugin.kochava.event.analyticsRequest.data] property provides information about the Kochava device&nbsp;ID.

* `"recorded"` &mdash; Indicates that an event was successfully recorded via [kochava.logEvent()][plugin.kochava.logEvent] or [kochava.logDeeplinkEvent()][plugin.kochava.logDeeplinkEvent].

* `"received"` &mdash; Indicates that attribution data was received <nobr>(see [kochava.getAttributionData()][plugin.kochava.getAttributionData])</nobr>. For this phase, the [event.data][plugin.kochava.event.analyticsRequest.data] property provides context on the received event.

* `"failed"` &mdash; Indicates that an error has occurred. For this phase, [event.type][plugin.kidoz.event.adsRequest.type] and [event.data][plugin.kidoz.event.adsRequest.data] can provide additional context.
