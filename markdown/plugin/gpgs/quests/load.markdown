# gpgs.quests.load()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, quests, load
> __See also__          [gpgs.quests][plugin.gpgs.quests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves information on quests available in the game. Optionally, this call can load a specific quest, a subset of quests, or filter all results.

## Syntax

	gpgs.quests.load( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### questId ~^(optional)^~
_[String][api.type.String]._ If provided, loads only this quest information. If omitted, information on all quests is loaded.

##### questIds ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to load information on each specified quest. If provided, this has higher priority than `questId`.

##### filters ~^(optional)^~
_[Array][api.type.Array]._ Populate with [string][api.type.String] elements to load only specific types of quests. Elements of this array can include: `"accepted"`, `"completed"`, <nobr>`"completed unclaimed"`</nobr>, <nobr>`"ending soon"`</nobr>, `"expired"`, `"failed"`, `"open"`, <nobr>`"recently failed"`</nobr>, and `"upcoming"`. Note that <nobr>`"ending soon"`</nobr> and <nobr>`"recently failed"`</nobr> are only supported on Android.

##### recentlyUpdatedFirst ~^(optional)^~
_[Boolean][api.type.Boolean]._ Supported only on Android; if `true`, the results will be sorted by date of modification.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be retrieved fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [load][plugin.gpgs.quests.event.load] event.
