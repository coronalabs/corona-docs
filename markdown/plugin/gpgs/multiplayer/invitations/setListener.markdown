# gpgs.multiplayer.invitations.setListener()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, invitations, setListener
> __See also__          [gpgs.multiplayer.invitations][plugin.gpgs.multiplayer.invitations]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Registers a listener function to intercept incoming invitations for the current user. If a listener is registered by this method, the incoming invitation will not generate a status bar notification as long as this client remains connected.

## Gotchas

Only one invitation listener may be active at a time. Calling this method while another invitation listener is registered will replace the original listener with the new one.

## Syntax

	gpgs.multiplayer.invitations.setListener( listener )

##### listener ~^(required)^~
_[Listener][api.type.Listener]._ Listener function which receives an [invitation][plugin.gpgs.multiplayer.invitations.event.invitation] event.