# object.getParticipant()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Match, getParticipant
> __See also__          [Match][plugin.gpgs.multiplayer.type.Match]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [table][api.type.Table] which contains the [Participant][plugin.gpgs.multiplayer.type.Participant] object for the specificied participant&nbsp;ID. Can return `nil` if not found.

## Syntax

	object.getParticipant( participantId )

##### participantId ~^(required)^~
_[String][api.type.String]._ The ID of the participant.