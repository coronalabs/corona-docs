# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [adsRequest][plugin.applovinMax.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, AppLovin, adsRequest, data, Applovin Max
> __See also__			[adsRequest][plugin.applovinMax.event.adsRequest]
>						[applovinMax.*][plugin.applovinMax]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

For the [phase][plugin.applovinMax.event.adsRequest.phase] of `"userReceivedReward"`, this table will contain the <nobr>key-value</nobr> pairs associated with the reward of the rewarded video (if&nbsp;enabled):

* `event.data.label` &mdash; The label for reward, configured in the [AppLovin developer portal](https://www.applovin.com/manage).
* `event.data.amount` &mdash; The reward amount, configured in the [AppLovin developer portal](https://www.applovin.com/manage).

For the [phase][plugin.applovinMax.event.adsRequest.phase] of `"playbackEnded"`, this table will contain the <nobr>key-value</nobr> pairs associated with the video:

* `event.data.percentPlayed` &mdash; The percentage of the video that the user has watched.
* `event.data.fullyWatched` &mdash; This will be `true` if the Applovin SDK considers that the user has fully watched the video <nobr>(may be less than 100%)</nobr>.

<div class="guide-notebox">
<div class="notebox-title">Note</div>

This table will also contain other <nobr>key-value</nobr> pairs if there is a problem validating the user's rewarded video, for example in cases of exceeding quota. These <nobr>key-value</nobr>  pairs are set directly from the native AppLovin response.

</div>
