# gpgs.videos.loadCapabilities()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, videos, loadCapabilities
> __See also__          [gpgs.videos][plugin.gpgs.videos]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves the video capabilities of the service, whether the microphone and/or <nobr>front-facing</nobr> camera are supported, if the service can write to external storage, and which capture modes and quality levels are available.

## Syntax

	gpgs.videos.loadCapabilities( listener )

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [loadCapabilities][plugin.gpgs.videos.event.loadCapabilities] event.