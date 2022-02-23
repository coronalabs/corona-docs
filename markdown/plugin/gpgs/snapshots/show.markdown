# gpgs.snapshots.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, snapshots, show
> __See also__          [gpgs.snapshots][plugin.gpgs.snapshots]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Shows the snapshots view.

## Syntax

	gpgs.snapshots.show( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### title ~^(optional)^~
_[String][api.type.String]._ The title to display in the action bar of the view.

##### disableAdd ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the __Add__ button will not be shown.

##### disableDelete ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the __Delete__ button will not be shown.

##### limit ~^(optional)^~
_[Number][api.type.Number]._ The maximum number of snapshots to display.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [show][plugin.gpgs.snapshots.event.show] event.