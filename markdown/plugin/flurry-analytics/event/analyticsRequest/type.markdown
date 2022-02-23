# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics, analyticsRequest, type
> __See also__			[analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]
>						[flurryAnalytics.*][plugin.flurry-analytics]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The type of analytics that was logged. If [event.phase][plugin.flurry-analytics.event.analyticsRequest.phase] is `"failed"`, indicates the type of analytics that failed to be logged.

Possible values include `"basic"` or `"timed"`.
