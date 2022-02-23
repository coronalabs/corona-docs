# gpgs.requests.getLimits()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, requests, getLimits
> __See also__          [gpgs.requests][plugin.gpgs.requests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves various limits associated with the requests API by returning a [table][api.type.Table] with the following properties. Can be `nil` if the service is unavailable.

* `lifetimeDays` &mdash; [Number][api.type.Number] representing the maximum lifetime of a request in days. This is guaranteed to be at least 14 days.

* `payloadSize` &mdash; [Number][api.type.Number] representing the maximum data size of a request payload in bytes. This is guaranteed to be at least 2&nbsp;KB and it may increase in the future.

## Syntax

	gpgs.requests.getLimits()
