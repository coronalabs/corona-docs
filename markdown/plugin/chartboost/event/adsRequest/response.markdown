# event.response

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.chartboost.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, adsRequest, response
> __See also__			[adsRequest][plugin.chartboost.event.adsRequest]
>						[chartboost.*][plugin.chartboost]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

If an [error][plugin.chartboost.event.adsRequest.isError] occurred, a [string][api.type.String] value response stating the reason. This event property is only available if [event.phase][plugin.chartboost.event.adsRequest.phase] is `"failed"`, in which case [event.data][plugin.chartboost.event.adsRequest.data] will also provide more information.
