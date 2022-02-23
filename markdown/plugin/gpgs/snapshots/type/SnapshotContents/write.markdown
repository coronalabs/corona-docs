# object.write()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, SnapshotContents, write
> __See also__          [SnapshotContents][plugin.gpgs.snapshots.type.SnapshotContents]
>						[gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Writes the specified data into the snapshot and returns `true` upon success. The data will persist on disk but it's not uploaded to the server until the snapshot is saved.

## Syntax

	object.write( payload )

##### payload ~^(required)^~
_[String][api.type.String]._ The data to replace the snapshot content with.