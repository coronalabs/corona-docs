# event.phase

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.revmob.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, RevMob, adsRequest, phase
> __See also__			[adsRequest][plugin.revmob.event.adsRequest]
>						[revmob.*][plugin.revmob]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] value indicating the phase of the [adsRequest][plugin.revmob.event.adsRequest] event. Possible values include:

* `"init"` &mdash; Indicates that the RevMob plugin was initialized successfully.

* `"sessionStarted"` &mdash; Indicates that the RevMob session was started successfully.

* `"sessionFailed"` &mdash; Indicates that the RevMob session failed to start.

* `"failed"` &mdash; Indicates that an ad failed to load. For this phase, [event.isError][plugin.revmob.event.adsRequest.isError] will be `true`. Additionally, [event.type][plugin.revmob.event.adsRequest.type] and [event.response][plugin.revmob.event.adsRequest.response] can provide additional context.

* `"loaded"` &mdash; Indicates that an ad loaded successfully. For this phase, [event.type][plugin.revmob.event.adsRequest.type] can provide additional context.

* `"clicked"` &mdash; Indicates that an ad was clicked.

* `"displayed"` &mdash; Indicates that an ad was displayed. For this phase, [event.type][plugin.revmob.event.adsRequest.type] can provide additional context.

* `"hidden"` &mdash; Indicates that an ad was closed/hidden. For this phase, [event.type][plugin.revmob.event.adsRequest.type] can provide additional context.

* `"videoNotFullyDownloaded"` &mdash; Indicates that a video ad has not yet finished downloading.

* `"videoPlaybackBegan"` &mdash; Indicates that a video ad playback has started.

* `"videoPlaybackEnded"` &mdash; Indicates that a video ad playback has ended/finished.

* `"rewardedVideoNotFullyDownloaded"` &mdash; Indicates that a rewarded video ad has not yet finished downloading.

* `"rewardedVideoPlaybackBegan"` &mdash; Indicates that a rewarded video ad playback has started.

* `"rewardedVideoPlaybackEnded"` &mdash; Indicates that a rewarded video ad playback has ended/finished.

* `"rewardedVideoCompleted"` &mdash; Indicates that a rewarded video ad has been watched to completion, and a reward can be given in your code.

* `"rewardedVideoPreRollDisplayed"` &mdash; Indicates that a rewarded video ad <nobr>pre-roll</nobr> has displayed.
