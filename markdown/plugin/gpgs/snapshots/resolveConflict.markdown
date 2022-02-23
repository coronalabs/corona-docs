# gpgs.snapshots.resolveConflict()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, snapshots, resolveConflict
> __See also__          [gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Resolves a conflict using the data from the provided snapshot. This will replace the data on the server with the specified snapshot. Note that it's possible for this operation to result in a conflict itself, in which case the resolution process should be repeated.

## Syntax

	gpgs.snapshots.resolveConflict( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### conflictId ~^(required)^~
_[String][api.type.String]._ The conflict to resolve.

##### snapshot ~^(required)^~
_[Snapshot][plugin.gpgs.snapshots.type.Snapshot]._ The snapshot to use to resolve the conflict.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [resolveConflict][plugin.gpgs.snapshots.event.resolveConflict] event.