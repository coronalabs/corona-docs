# object.modify()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, SnapshotContents, modify
> __See also__          [SnapshotContents][plugin.gpgs.snapshots.type.SnapshotContents]
>						[gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Overwrites the provided data into the snapshot with a specified offset and returns `true` upon success. The data will persist on disk but it's not uploaded to the server until the snapshot is saved.

## Syntax

	object.modify( data, offset )

##### data ~^(required)^~
_[String][api.type.String]._ The data bytes to modify the snapshot content with.

##### offset ~^(required)^~
_[Number][api.type.Number]._ The position in content to start writing from.