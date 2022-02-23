# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.chartboost.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Chartboost, adsRequest, data
> __See also__			[adsRequest][plugin.chartboost.event.adsRequest]
>						[chartboost.*][plugin.chartboost]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

JSON-encoded [string][api.type.String]. Provides additional context for certain event [phases][plugin.chartboost.event.adsRequest.phase] with the following properties: 

* `reward` ([Number][api.type.Number]) &mdash; Applies only to rewarded video ads <nobr>([event.type][plugin.chartboost.event.adsRequest.type] of `"rewardedVideo"`)</nobr> and a [phase][plugin.chartboost.event.adsRequest.phase] of `"reward"`. Indicates the reward amount to be given to the user.

* `location` ([string][api.type.String]) &mdash; The advertisement location. See [here][plugin.chartboost.show#locations] for a list of valid <nobr>pre-defined</nobr> options.

* `errorCode` ([string][api.type.String]) &mdash; Applies to events with a [phase][plugin.chartboost.event.adsRequest.phase] of `"failed"`. This property contains the error code.

* `errorMsg` ([string][api.type.String]) &mdash; Applies to events with a [phase][plugin.chartboost.event.adsRequest.phase] of `"failed"`. This property contains the error message.
