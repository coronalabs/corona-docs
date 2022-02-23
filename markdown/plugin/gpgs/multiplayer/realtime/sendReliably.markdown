# gpgs.multiplayer.realtime.sendReliably()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, real-time, sendReliably
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sends a message to participants in a <nobr>real-time</nobr> room reliably. You can receive callbacks to report the status of the send operation for each participant.

## Syntax

	gpgs.multiplayer.realtime.sendReliably( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### roomId ~^(required)^~
_[String][api.type.String]._ The multiplayer room ID.

##### participantId ~^(optional)^~
_[String][api.type.String]._ The participant to send the message to.

##### participantIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to send the message to the specified participants. If provided, this has higher priority than `participantId`.

##### payload ~^(required)^~
_[String][api.type.String]._ The message to send. This has a size limit as noted in [plugin.gpgs.multiplayer.getLimits()][plugin.gpgs.multiplayer.getLimits].

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [sendReliably][plugin.gpgs.multiplayer.realtime.event.sendReliably] event.
