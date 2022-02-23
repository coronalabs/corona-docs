# gpgs.snapshots.save()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, snapshots, save
> __See also__          [gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Commits any modifications made to the snapshot. This will cause the changes to be synced to the server in the background.

## Syntax

	gpgs.snapshots.save( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### snapshot ~^(required)^~
_[Snapshot][plugin.gpgs.snapshots.type.Snapshot]._ The snapshot to save.

##### description ~^(optional)^~
_[String][api.type.String]._ The description of this snapshot to be displayed to the player.

##### playedTime ~^(optional)^~
_[Number][api.type.Number]._ The number of milliseconds played by the player.

##### progress ~^(optional)^~
_[Number][api.type.Number]._ The progress value.

##### image ~^(optional)^~
_[Table][api.type.Table]._ [Image][plugin.gpgs.type.Image] object to upload and use as a snapshot cover image.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [save][plugin.gpgs.snapshots.event.save] event.