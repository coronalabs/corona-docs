# gpgs.quests.claim()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, quests, claim
> __See also__          [gpgs.quests][plugin.gpgs.quests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Claims a reward for a completed milestone of a specific quest.

## Syntax

	gpgs.quests.claim( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### questId ~^(required)^~
_[String][api.type.String]._ The quest associated with the completed milestone.

##### milestoneId ~^(required)^~
_[String][api.type.String]._ The milestone to claim a reward from.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [claim][plugin.gpgs.quests.event.claim] event.