# gpgs.getServerAuthCode()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, getServerAuthCode
> __See also__          [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Requests a special authentication code for a custom server that uses Google's OAuth&nbsp;client&nbsp;API.


## Syntax

	gpgs.getServerAuthCode( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.


## Parameter Reference

The `params` table includes parameters for the call.

##### serverId ~^(required)^~
_[String][api.type.String]._ Custom server's OAuth client ID.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [getServerAuthCode][plugin.gpgs.event.getServerAuthCode] event.
