# gpgs.requests.accept()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, requests, accept
> __See also__          [gpgs.requests][plugin.gpgs.requests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Accept a single request or multiple requests.

## Syntax

	gpgs.requests.accept( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### requestId ~^(optional)^~
_[String][api.type.String]._ The request to accept.

##### requestIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to accept each specified request. If provided, this has higher priority than `requestId`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives an [accept][plugin.gpgs.requests.event.accept] event.