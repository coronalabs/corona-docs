# gpgs.quests.accept()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, quests, accept
> __See also__          [gpgs.quests][plugin.gpgs.quests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Accepts a quest.

## Syntax

	gpgs.quests.accept( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### questId ~^(required)^~
_[String][api.type.String]._ The quest to accept.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives an [accept][plugin.gpgs.quests.event.accept] event.