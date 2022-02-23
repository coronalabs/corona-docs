# gpgs.snapshots.open()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, snapshots, open
> __See also__          [gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Opens a snapshot with the given filename.

## Syntax

	gpgs.snapshots.open( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### filename ~^(required)^~
_[String][api.type.String]._ The snapshot's unique file name.

##### create ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, and in the case of a snapshot __not__ being found with the specified `filename`, a new snapshot will be created and opened.

##### conflictPolicy ~^(optional)^~
_[String][api.type.String]._ The conflict resolution policy to use for this snapshot. Possible values include:

* `"manual"`
* `"highest progress"`
* `"last known good"` (default)
* `"longest playtime"`
* `"most recently modified"`

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives an [open][plugin.gpgs.snapshots.event.open] event.
