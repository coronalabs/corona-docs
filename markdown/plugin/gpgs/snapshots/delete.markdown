# gpgs.snapshots.delete()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, snapshots, delete
> __See also__          [gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Deletes the specified snapshot. This will delete the data of the snapshot locally __and__ on the server.

## Syntax

	gpgs.snapshots.delete( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### snapshot ~^(required)^~
_[Snapshot][plugin.gpgs.snapshots.type.Snapshot]._ The snapshot to delete.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [delete][plugin.gpgs.snapshots.event.delete] event.