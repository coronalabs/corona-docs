# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.unityads.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, Unity Ads, adsRequest, data
> __See also__			[adsRequest][plugin.unityads.event.adsRequest]
>						[unityads.*][plugin.unityads]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

JSON-encoded [string][api.type.String]. Provides additional context for certain event [phases][plugin.unityads.event.adsRequest.phase] with the following properties: 

* `placementId` ([string][api.type.String]) &mdash; Indicates the placement&nbsp;ID which the event refers to.

* `statusCode` ([string][api.type.String]) &mdash; Applies to events with a [phase][plugin.unityads.event.adsRequest.phase] of `"placementStatus"`. This property contains the placement's status code.

* `statusInfo` ([string][api.type.String]) &mdash; Applies to events with a [phase][plugin.unityads.event.adsRequest.phase] of `"placementStatus"`. This property contains descriptive information about the placement's ad status.

* `errorCode` ([string][api.type.String]) &mdash; Applies to events with a [phase][plugin.unityads.event.adsRequest.phase] of `"failed"`. This property contains the error code.

* `errorMsg` ([string][api.type.String]) &mdash; Applies to events with a [phase][plugin.unityads.event.adsRequest.phase] of `"failed"`. This property contains the error message.
