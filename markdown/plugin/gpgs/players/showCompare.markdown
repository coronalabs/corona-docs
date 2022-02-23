# players.showCompare()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, players, showCompare
> __See also__          [gpgs.players][plugin.gpgs.players]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

<div class="docs-tip-outer">
<div class="docs-tip-inner-left">
<div class="fa fa-android" style="font-size: 39px; padding-top: 1px;"></div>
</div>
<div class="docs-tip-inner-right">

This feature is currently only supported on Android.

</div>
</div>


## Overview

Shows a view to compare the current player with a specified one.

## Syntax

	gpgs.players.showCompare( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### playerId ~^(required)^~
_[String][api.type.String]._ The player to compare with.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [showCompare][plugin.gpgs.players.event.showCompare] event.
