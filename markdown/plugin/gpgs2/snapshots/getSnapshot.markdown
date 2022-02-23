# gpgs.snapshots.getSnapshot()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.snapshots.*][plugin.gpgs2.snapshots]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Returns a [Snapshot][plugin.gpgs2.type/Snapshot] object. To use this method the specified snapshot must be opened using [open][plugin.gpgs2.open] method before that.

## Syntax

	gpgs.snapshots.getSnapshot(snapshotId)

##### snapshotId ~^(required)^~
_[String][api.type.String]._ Snapshot to retrive.