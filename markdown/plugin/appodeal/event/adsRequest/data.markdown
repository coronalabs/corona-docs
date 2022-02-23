# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Event__             [adsRequest][plugin.appodeal.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Appodeal, adsRequest, data
> __See also__			[adsRequest][plugin.appodeal.event.adsRequest]
>						[appodeal.*][plugin.appodeal]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Table containing <nobr>key-value</nobr> pairs relating to ad events. These values are returned directly from the Appodeal response.

<div class="guide-notebox-imp">
<div class="notebox-title-imp">Important</div>

For now, these event parameters are available only on Corona modular Appodeal plugin beta SDK >= 2.4.3.

</div>

### Banner Event

* `height` ([Number][api.type.Number]) &mdash; returns height parameter for loaded banner.

* `isPrecache` ([Boolean][api.type.Boolean]) &mdash; returns `true` if banner was precached.

### Interstitial Event

* `isPrecache` ([Boolean][api.type.Boolean]) &mdash; returns `true` if interstitial was precached.

### Rewarded Video Event

* `amount` ([Number][api.type.Number]) &mdash; Applies only to rewarded video events with a [phase][plugin.appodeal.event.adsRequest.phase] of `"playbackEnded"`. Indicates the reward amount to be given to the user.

* `name` ([String][api.type.String]) &mdash; Applies only to rewarded video events with a [phase][plugin.appodeal.event.adsRequest.phase] of `"playbackEnded"`. Indicates the reward name to be given to the user.

* `loaded` ([Boolean][api.type.Boolean]) &mdash; Applies only to rewarded video events with a [phase][plugin.appodeal.event.adsRequest.phase] of `"loaded"`. Returns `true` if rewarded video was loaded.

* `finished` ([Boolean][api.type.Boolean]) &mdash; Applies only to rewarded video events with a [phase][plugin.appodeal.event.adsRequest.phase] of `"closed"`. Returns `true` if rewarded video closing was finished.
