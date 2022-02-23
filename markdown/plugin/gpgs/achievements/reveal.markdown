# achievements.reveal()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, achievements, reveal
> __See also__          [gpgs.achievements][plugin.gpgs.achievements]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Reveals a hidden achievement.

## Syntax

	gpgs.achievements.reveal( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.


## Parameter Reference

The `params` table contains parameters for the call.

##### achievementId ~^(required)^~
_[String][api.type.String]._ Achievement to reveal.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [reveal][plugin.gpgs.achievements.event.reveal] event.