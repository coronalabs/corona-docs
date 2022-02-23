# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.chartboost.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, adsRequest, type
> __See also__			[adsRequest][plugin.chartboost.event.adsRequest]
>						[chartboost.*][plugin.chartboost]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The type of ad that was loaded, displayed, viewed, clicked/tapped, or closed/hidden. If [event.phase][plugin.chartboost.event.adsRequest.phase] is `"failed"`, indicates the type of ad that failed to load.

Possible values include `"interstitial"`, `"rewardedVideo"`, or `"moreApps"`.
