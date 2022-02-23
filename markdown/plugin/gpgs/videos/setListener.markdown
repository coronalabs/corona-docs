# gpgs.videos.setListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, videos, setListener
> __See also__          [gpgs.videos][plugin.gpgs.videos]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Registers a listener function to listen for changes to the overlay state launched by [gpgs.videos.show()][plugin.gpgs.videos.show].

## Gotchas

Only one video listener may be active at a time. Calling this method while another video listener is registered will replace the original listener with the new one.

## Syntax

	gpgs.videos.setListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function which receives a [video][plugin.gpgs.videos.event.video] event.