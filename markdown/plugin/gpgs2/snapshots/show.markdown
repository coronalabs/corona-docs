# gpgs.snapshots.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.snapshots.*][plugin.gpgs2.snapshots]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Shows snapshots view.

## Syntax

	gpgs.snapshots.show(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### title ~^(optional)^~
_[String][api.type.String]._ The title to display in the action bar of the view.

##### disableAdd ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the Add button will not be shown.

##### disableDelete ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the Delete button will not be shown.

##### limit ~^(optional)^~
_[Integer][api.type.Number]._ The maximum number of snapshots to display.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [show][plugin.gpgs2.snapshots.event.show] event.