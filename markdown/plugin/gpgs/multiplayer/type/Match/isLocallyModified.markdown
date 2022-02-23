# object.isLocallyModified

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Match, isLocallyModified
> __See also__          [Match][plugin.gpgs.multiplayer.type.Match]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Boolean][api.type.Boolean] indicating whether or not this match has been locally modified. If this is `true`, the local device has match state which has not yet successfully synced to the server. In this state, further mutations to the match will fail.