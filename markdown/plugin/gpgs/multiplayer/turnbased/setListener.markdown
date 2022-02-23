# gpgs.multiplayer.turnbased.setListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, turn-based, setListener
> __See also__          [gpgs.multiplayer.turnbased][plugin.gpgs.multiplayer.turnbased]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Registers a listener function to intercept incoming match updates for the current user. If a listener is registered by this method, the incoming match update will not generate a status bar notification as long as this client remains connected.

## Gotchas

Only one match update listener may be active at a time. Calling this method while another match update listener is registered will replace the original listener with the new one.

## Syntax

	gpgs.multiplayer.turnbased.setListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function which receives a [match][plugin.gpgs.multiplayer.turnbased.event.match] event.