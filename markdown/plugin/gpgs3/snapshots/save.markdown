# gpgs.snapshots.save()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.snapshots.*][plugin.gpgs3.snapshots]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Commits any modifications made to the snapshot. This will cause the changes to be synced to the server in the background.

## Syntax

	gpgs.snapshots.save(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### snapshotId ~^(required)^~
_[String][api.type.String]._ Snapshot to save.

##### description ~^(optional)^~
_[String][api.type.String]._ The description of this snapshot to be displayed to the player.

##### playedTime ~^(optional)^~
_[Integer][api.type.Number]._ The number of milliseconds played by the player.

##### progress ~^(optional)^~
_[Integer][api.type.Number]._ The progress value.

##### image ~^(optional)^~
_[Table][api.type.Table]._ [Image][plugin.gpgs3.type.Image] object. File to upload and use as a snapshot cover image.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [save][plugin.gpgs3.snapshots.event.save] event.