# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics, analyticsRequest, data
> __See also__			[analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]
>						[flurryAnalytics.*][plugin.flurry-analytics]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Provides additional context for certain event [phases][plugin.flurry-analytics.event.analyticsRequest.phase] as follows: 

* `event` (`event.data.event`) ([string][api.type.String]) &mdash; The name of the event being logged.

* `params` (`event.data.params`) ([table][api.type.Table]) &mdash; A table of <nobr>key-value</nobr> pairs which mirrors any parameters you passed when logging an event or starting/ending a timed event.

* `errorCode` (`event.data.errorCode`) ([string][api.type.String]) &mdash; The error code of the failure. Only available if [event.isError][plugin.flurry-analytics.event.analyticsRequest.isError] is `true`.

* `reason` (`event.data.reason`) ([string][api.type.String]) &mdash; The reason for an error. This is the <nobr>human-readable</nobr> version of `errorCode`. Only available if [event.isError][plugin.flurry-analytics.event.analyticsRequest.isError] is `true`.
