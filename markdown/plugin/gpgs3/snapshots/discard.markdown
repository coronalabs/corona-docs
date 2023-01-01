# gpgs.snapshots.discard()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.snapshots.*][plugin.gpgs3.snapshots]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Discards the contents of the snapshot and closes the contents. This will discard all changes made to the file, and close the snapshot to future changes until it is re-opened. The file will not be modified on the server.

## Syntax

	gpgs.snapshots.discard(snapshotId)

##### snapshotId ~^(required)^~
_[String][api.type.String]._ SnapshotId to discard.