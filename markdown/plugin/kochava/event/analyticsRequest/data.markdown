# event.data

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [analyticsRequest][plugin.kochava.event.analyticsRequest]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          analytics, attribution, Kochava, analyticsRequest, data
> __See also__			[analyticsRequest][plugin.kochava.event.analyticsRequest]
>						[kochava.*][plugin.kochava]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] which provides additional context for certain event [phases][plugin.kochava.event.analyticsRequest.phase] as follows: 

* For a [phase][plugin.kochava.event.analyticsRequest.phase] of `"init"`, the Kochava device&nbsp;ID.

* For a [phase][plugin.kochava.event.analyticsRequest.phase] of `"received"`, a <nobr>JSON-encoded</nobr> string containing the attribution data.
