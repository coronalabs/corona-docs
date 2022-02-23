# gpgs.videos.isModeAvailable()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, videos, isModeAvailable
> __See also__          [gpgs.videos][plugin.gpgs.videos]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Queries whether the capture service is already in use or not.

## Syntax

	gpgs.videos.isModeAvailable( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### mode ~^(required)^~
_[String][api.type.String]._ Capture mode of either `"file"` or `"stream"`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives an [isModeAvailable][plugin.gpgs.videos.event.isModeAvailable] event.