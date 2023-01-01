# gpgs.snapshots.resolveConflict()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.snapshots.*][plugin.gpgs3.snapshots]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Resolve a conflict using the data from the provided snapshot. This will replace the data on the server with the specified snapshot. Note that it is possible for this operation to result in a conflict itself, in which case resolution should be repeated.

## Syntax

	gpgs.snapshots.resolveConflict(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### conflictId ~^(required)^~
_[String][api.type.String]._ Conflict to resolve.

##### snapshotId ~^(required)^~
_[String][api.type.String]._ Snapshot to delete.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [resolveConflict][plugin.gpgs3.snapshots.event.resolveConflict] event.