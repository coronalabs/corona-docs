# gpgs.multiplayer.realtime.setListeners()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, real-time, setListeners
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Registers listeners to intercept incoming messages for the multiplayer room. This is useful for tracking the status of peers, the room, and messages.

## Gotchas

Only one listener of each type may be active at a time. Calling this method while another listener of the same type is registered will replace the original listener with the new one.

## Syntax

	gpgs.multiplayer.realtime.setListeners( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### message ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [message][plugin.gpgs.multiplayer.realtime.event.message] event.

##### peer ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [peer][plugin.gpgs.multiplayer.realtime.event.peer] event.

##### room ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [room][plugin.gpgs.multiplayer.realtime.event.room] event.
