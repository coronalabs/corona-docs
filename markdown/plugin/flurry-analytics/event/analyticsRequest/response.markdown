# event.response

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, Flurry Analytics, analyticsRequest, response
> __See also__			[analyticsRequest][plugin.flurry-analytics.event.analyticsRequest]
>						[flurryAnalytics.*][plugin.flurry-analytics]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

If an [error][plugin.flurry-analytics.event.analyticsRequest.isError] occurred, a [string][api.type.String] value response stating the reason. This event property is only available if [event.phase][plugin.flurry-analytics.event.analyticsRequest.phase] is `"failed"`.
