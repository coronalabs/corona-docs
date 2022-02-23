# gpgs.videos.getState()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.videos.*][plugin.gpgs2.videos]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves the current state of the capture service. This will inform about whether the capture overlay is visible, if the overlay is actively being used to capture, and a much more.

## Syntax

	gpgs.videos.getState(listener)

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [getState][plugin.gpgs2.videos.event.getState] event.