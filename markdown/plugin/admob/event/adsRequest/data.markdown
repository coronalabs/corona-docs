# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.string]
> __Event__             [adsRequest][plugin.admob.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdMob, adsRequest, data
> __See also__			[adsRequest][plugin.admob.event.adsRequest]
>						[admob.*][plugin.admob]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A <nobr>JSON-formatted</nobr> string which contains the following fields:

* `adUnitId` &mdash; The AdMob ad unit ID that generated the event.
* `rewardItem` &mdash; The reward item name as defined in the AdMob dashboard. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"reward"`.
* `rewardAmount` &mdash; The reward item amount as defined in the AdMob dashboard. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"reward"`.
* `errorCode` &mdash; The error code for the event that failed. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"failed"`.
* `errorMsg` &mdash; An error message with the reason for the failure. This is only available when [event.phase][plugin.admob.event.adsRequest.phase] is `"failed"`.
