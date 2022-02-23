# event.isError

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Event__             [adsRequest][plugin.fuse.event.adsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          ads, advertising, monetization, fuse, adsRequest, isError
> __See also__			[adsRequest][plugin.fuse.event.adsRequest]
>						[fuse.*][plugin.fuse]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Boolean][api.type.Boolean] value indicating whether an error occurred. If this is `true`, [event.response][plugin.fuse.event.adsRequest.response] will be a [string][api.type.String] value stating the reason.

Note that if checking this property during the `"loaded"` event phase (triggered via [fuse.load()][plugin.fuse.load]), a value of `true` indicates that an ad could __not__ be loaded from the requested zone.