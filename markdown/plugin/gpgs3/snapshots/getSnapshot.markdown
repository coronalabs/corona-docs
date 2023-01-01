# gpgs.snapshots.getSnapshot()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.snapshots.*][plugin.gpgs3.snapshots]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [Snapshot][plugin.gpgs3.type/Snapshot] object. To use this method the specified snapshot must be opened using [open][plugin.gpgs3.open] method before that.

## Syntax

	gpgs.snapshots.getSnapshot(snapshotId)

##### snapshotId ~^(required)^~
_[String][api.type.String]._ Snapshot to retrive.