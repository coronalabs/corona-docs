# gpgs.snapshots.discard()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.snapshots.*][plugin.gpgs2.snapshots]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Discards the contents of the snapshot and closes the contents. This will discard all changes made to the file, and close the snapshot to future changes until it is re-opened. The file will not be modified on the server.

## Syntax

	gpgs.snapshots.discard(snapshotId)

##### snapshotId ~^(required)^~
_[String][api.type.String]._ SnapshotId to discard.