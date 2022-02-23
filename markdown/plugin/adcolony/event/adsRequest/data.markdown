# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.adcolony.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AdColony, adsRequest, data
> __See also__			[adsRequest][plugin.adcolony.event.adsRequest]
>						[adcolony.*][plugin.adcolony]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

JSON-encoded [string][api.type.String]. Provides additional context for certain event [phases][plugin.adcolony.event.adsRequest.phase] with the following properties: 

### All Events

* `zoneName` ([string][api.type.String]) &mdash; The zone name as defined in the call to [adcolony.init()][plugin.adcolony.init]. 

### Rewarded Video Event

* `reward` ([Number][api.type.Number]) &mdash; Applies only to rewarded video events with a [phase][plugin.adcolony.event.adsRequest.phase] of `"reward"`. Indicates the reward amount to be given to the user.

* `currencyName` ([String][api.type.String]) &mdash; The virtual currency name of the reward.

### Zone Information Event

The following are returned for the event triggered by [adcolony.getInfoForZone()][plugin.adcolony.getInfoForZone]:

* `isRewardedZone` ([Boolean][api.type.Boolean]) &mdash; `true` if the zone is a rewarded video zone.

* `virtualCurrencyName` ([String][api.type.String]) &mdash; The virtual currency name of a reward.

* `rewardAmount` ([Number][api.type.Number]) &mdash; The virtual currency amount when a reward is given.

* `viewsPerReward` ([Number][api.type.Number]) &mdash; Number of views required to receive a reward.

* `viewsUntilReward` ([Number][api.type.Number]) &mdash; Number of views remaining until a reward is given.
