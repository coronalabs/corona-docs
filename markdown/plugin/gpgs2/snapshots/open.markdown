# gpgs.snapshots.open()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.snapshots.*][plugin.gpgs2.snapshots]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on all snapshots for the current game.

## Syntax

	gpgs.snapshots.open(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### filename ~^(required)^~
_[String][api.type.String]._ Snapshot unique name.

##### create ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, in case of snapshot not being found with the specified `filename`, a new snapshot will be created and opened.

##### conflictPolicy ~^(optional)^~
_[String][api.type.String]._ The conflict resolution policy to use for this snapshot. Possibe values: `"manual"`, `"highest progress"`, `"last known good"`, `"longest playtime"`, `"most recently modified"`. Default is `"manual"`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [open][plugin.gpgs2.snapshots.event.open] event.