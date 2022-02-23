# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [analyticsRequest][plugin.appsflyer.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, AppsFlyer, analyticsRequest, phase
> __See also__			[analyticsRequest][plugin.appsflyer.event.analyticsRequest]
>						[appsflyer.*][plugin.appsflyer]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] indicating the phase of the [analyticsRequest][plugin.appsflyer.event.analyticsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the AppsFlyer plugin was initialized successfully.

* `"recorded"` &mdash; Indicates that an event was successfully recorded via [appsflyer.logEvent()][plugin.appsflyer.logEvent].

* `"received"` &mdash; Indicates that attribution data was received. For this phase, the [event.data][plugin.appsflyer.event.analyticsRequest.data] property provides context on the received event.

* `"failed"` &mdash; Indicates that an error has occurred. For this phase, [event.type][plugin.appsflyer.event.adsRequest.type] and [event.data][plugin.appsflyer.event.adsRequest.data] can provide additional context.
