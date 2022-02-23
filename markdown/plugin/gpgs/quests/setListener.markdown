# gpgs.quests.setListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, quests, setListener
> __See also__          [gpgs.quests][plugin.gpgs.quests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Registers a listener function to receive updates on quests.

## Gotchas

Only one quest listener may be active at a time. Calling this method while another quest listener is registered will replace the original listener with the new one.

## Syntax

	gpgs.quests.setListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function which receives a [quest][plugin.gpgs.quests.event.quest] event.