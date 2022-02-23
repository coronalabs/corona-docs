# gpgs.snapshots.discard()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, snapshots, discard
> __See also__          [gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Discards the contents of the snapshot and closes the contents. This will discard all changes made to the file and close the snapshot to future changes until it's <nobr>re-opened</nobr>. The file will not be modified on the server.

## Syntax

	gpgs.snapshots.discard( snapshot )

##### snapshot ~^(required)^~
_[Snapshot][plugin.gpgs.snapshots.type.Snapshot]._ The snapshot to discard.