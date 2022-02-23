# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.vungle.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Vungle, adsRequest, type
> __See also__			[adsRequest][plugin.vungle.event.adsRequest]
>						[vungle.*][plugin.vungle]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The specific type of event associated with the dispatched event. Possible values include:

* `"adInitialize"` &mdash; Occurs when the ad placement has successfully initialized.

* `"adStart"` &mdash; If [event.isError][plugin.vungle.event.adsRequest.isError] is `false`, the ad will play. If [event.isError][plugin.vungle.event.adsRequest.isError] is `true`, the ad has __not__ finished caching and will not play.

* `"adAvailable"` &mdash; Occurs when playability changes to/from `true`/`false`. This can be used to set a flag to `true` when download completes. For instance, you could check [event.placementID][plugin.vungle.event.adsRequest.placementID] and [event.isAdPlayable][plugin.vungle.event.adsRequest.isAdPlayable] to set a flag to `true`, then check this flag later in your app and play an ad if it's `true`.

* `"adEnd"` &mdash; Occurs when the end card is closed and control is returned to the app.

* `"adLog"` &mdash; Occurs when ad activity information is passed.

* `"vungleSDKlog"` &mdash; Occurs upon logging of an event from the SDK.
