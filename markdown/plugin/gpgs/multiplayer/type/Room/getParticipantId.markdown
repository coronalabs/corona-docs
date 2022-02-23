# object.getParticipantId()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Room, getParticipantId
> __See also__          [Room][plugin.gpgs.multiplayer.type.Room]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [string][api.type.String] representing the participant ID of the given player, or `nil` if not found.

## Syntax

	object.getParticipantId( playerId )

##### playerId ~^(required)^~
_[String][api.type.String]._ The ID of the player.