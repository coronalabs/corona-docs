# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.fuse.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, adsRequest, phase
> __See also__			[adsRequest][plugin.fuse.event.adsRequest]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.fuse.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the Fuse system finished initializing.

* `"loaded"` &mdash; Indicates that an ad of the specified ad zone is loaded and cached as a result of [fuse.load()][plugin.fuse.load].

* `"prepare"` &mdash; Indicates that an ad is about to be displayed. This phase is dispatched at some point after calling [fuse.show()][plugin.fuse.show] and it can be used for purposes such as muting game sounds, pausing animations, etc. During this phase, two additional properties are provided, `event.networkId` and `event.mediaType`, specifying which ad provider and which madia type is about to be used. Also note that if [event.isError][plugin.fuse.event.adsRequest.isError] is `true` during this phase, the ad will not show because of an error (it failed to download,&nbsp;etc).

* `"shown"` &mdash; Indicates that an ad has finished showing. This phase is always dispatched at some point after calling [fuse.show()][plugin.fuse.show], either when the ad is closed or when no ad is loaded before timing out. Thus, this phase carries the implication that the app should proceed.

* `"completed"` &mdash; Indicates that a user has accepted an offer or completed a task for a reward. In this case, the [event.payload][plugin.fuse.event.adsRequest.payload] property will contain details about the reward.