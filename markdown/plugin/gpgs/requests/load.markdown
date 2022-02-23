# gpgs.requests.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, requests, load
> __See also__          [gpgs.requests][plugin.gpgs.requests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on requests for the current game.

## Syntax

	gpgs.requests.load( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### outgoing ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, only requests that the current player sent will be shown. By default, incoming requests are shown.

##### expiringSoonFirst ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the results will be sorted by expiration date. By default, the results are sorted in social order.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [load][plugin.gpgs.requests.event.load] event.