# gpgs.getServerAuthCode()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Requests a special authentication code for a custom server that uses Google's OAuth Client api.

## Syntax

	gpgs.getServerAuthCode(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### serverId ~^(required)^~
_[String][api.type.String]._ Custom server's OAuth client id.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [getServerAuthCode][plugin.gpgs3.event.getServerAuthCode] event.
