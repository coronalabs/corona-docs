# gpgs.snapshots.delete()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.snapshots.*][plugin.gpgs3.snapshots]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Delete the specified snapshot. This will delete the data of the snapshot locally and on the server.

## Syntax

	gpgs.snapshots.delete(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### snapshotId ~^(required)^~
_[String][api.type.String]._ Snapshot to delete.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [delete][plugin.gpgs3.snapshots.event.delete] event.