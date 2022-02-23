# gpgs.quests.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, quests, show
> __See also__          [gpgs.quests][plugin.gpgs.quests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Shows quests. Optionally, this call can show a specific quest or filter all results.

## Syntax

	gpgs.quests.show( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### questId ~^(optional)^~
_[String][api.type.String]._ If provided, only this particular quest is shown.

##### filters ~^(optional)^~
_[Array][api.type.Array]._ Supported only on Android; populate with [string][api.type.String] elements to show only specific types of quests. Elements of this array can include: `"accepted"`, `"completed"`, <nobr>`"completed unclaimed"`</nobr>, <nobr>`"ending soon"`</nobr>, `"expired"`, `"failed"`, `"open"`, <nobr>`"recently failed"`</nobr>, and `"upcoming"`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [show][plugin.gpgs.quests.event.show] event.