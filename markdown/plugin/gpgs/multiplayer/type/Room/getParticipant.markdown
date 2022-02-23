# object.getParticipant()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Room, getParticipant
> __See also__          [Room][plugin.gpgs.multiplayer.type.Room]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [table][api.type.Table] containing the [Participant][plugin.gpgs.multiplayer.type.Participant] object for the specified participant&nbsp;ID, or `nil` if not found.

## Syntax

	object.getParticipant( participantId )

##### participantId ~^(required)^~
_[String][api.type.String]._ The ID of the participant.