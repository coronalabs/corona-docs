# gpgs.videos.isModeAvailable()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.videos.*][plugin.gpgs2.videos]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Fetch if the capture service is already in use or not.

## Syntax

	gpgs.videos.isModeAvailable(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### mode ~^(required)^~
_[String][api.type.String]._ Capture mode. Either `"file"` or `"stream"`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [isModeAvailable][plugin.gpgs2.videos.event.isModeAvailable] event.