# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.string]
> __Event__             [adsRequest][plugin.unityads-v4.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, adsRequest, data
> __See also__			[adsRequest][plugin.unityads-v4.event.adsRequest]
>						[unityads.*][plugin.unityads-v4]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

JSON-encoded [string][api.type.String]. Provides additional context for certain event [phases][plugin.unityads-v4.event.adsRequest.phase] with the following properties:

* `placementId` ([string][api.type.String]) &mdash; Indicates the placement&nbsp;ID which the event refers to.

* `errorCode` ([string][api.type.String]) &mdash; Applies to events with a [phase][plugin.unityads-v4.event.adsRequest.phase] of `"failed"`. This property contains the error code.

* `errorMsg` ([string][api.type.String]) &mdash; Applies to events with a [phase][plugin.unityads-v4.event.adsRequest.phase] of `"failed"`. This property contains the error message.
