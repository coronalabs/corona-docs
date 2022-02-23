# gpgs.multiplayer.realtime.getRoom()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, multiplayer, real-time, getRoom
> __See also__          [gpgs.multiplayer.realtime][plugin.gpgs.multiplayer.realtime]
>						[gpgs.multiplayer][plugin.gpgs.multiplayer]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [Room][plugin.gpgs.multiplayer.type.Room] object. To use this method, the specified room must already be created or joined into.

## Syntax

	gpgs.multiplayer.realtime.getRoom( roomId )

##### roomId ~^(required)^~
_[String][api.type.String]._ The room to retrieve.