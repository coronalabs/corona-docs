# event.type

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [adsRequest][plugin.mediaBrix.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, MediaBrix, adsRequest, type
> __See also__			[adsRequest][plugin.mediaBrix.event.adsRequest]
>						[mediaBrix.*][plugin.mediaBrix]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

The type of ad that triggered the event. If [event.phase][plugin.mediaBrix.event.adsRequest.phase] is `"failed"`, indicates the type of ad that failed to load. In either case, [event.placementId][plugin.mediaBrix.event.adsRequest.placementId] can provide additional context.