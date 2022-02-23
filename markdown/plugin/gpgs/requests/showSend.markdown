# gpgs.requests.showSend()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, requests, showSend
> __See also__          [gpgs.requests][plugin.gpgs.requests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Shows a view to send a request to another player.

## Syntax

	gpgs.requests.showSend( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### type ~^(required)^~
_[String][api.type.String]._ Either `"gift"` or `"wish"`.

##### payload ~^(required)^~
_[String][api.type.String]._ Custom data associated with this request.

##### description ~^(required)^~
_[String][api.type.String]._ The text describing the request.

##### requestLifetimeDays ~^(optional)^~
_[Number][api.type.Number]._ Time limit for the request in days.

##### playerId ~^(optional)^~
_[String][api.type.String]._ Player to whom to send the request.

##### playerIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to send the request to multiple players. If provided, this has higher priority than `playerId`.

##### image ~^(optional)^~
_[Table][api.type.Table]._ An [Image][plugin.gpgs.type.Image] object to upload and use as a request image.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [showSend][plugin.gpgs.requests.event.showSend] event.
