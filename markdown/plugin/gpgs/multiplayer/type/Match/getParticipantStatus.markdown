# object.getParticipantStatus()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Match, getParticipantStatus
> __See also__          [Match][plugin.gpgs.multiplayer.type.Match]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [string][api.type.String] representing the status of a participant, or `nil` if not found. Can be one of the following:

* `"invited"`
* `"joined"`
* `"declined"`
* `"left"`
* `"not invited yet"`

## Syntax

	object.getParticipantStatus( participantId )

##### participantId ~^(required)^~
_[String][api.type.String]._ The ID of the participant.