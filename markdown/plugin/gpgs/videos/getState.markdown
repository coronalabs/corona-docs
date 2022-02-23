# gpgs.videos.getState()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, videos, getState
> __See also__          [gpgs.videos][plugin.gpgs.videos]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves the current state of the capture service. This provides information about whether the capture overlay is visible, if the overlay is actively being used to capture, and much more.

## Syntax

	gpgs.videos.getState( listener )

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [getState][plugin.gpgs.videos.event.getState] event.