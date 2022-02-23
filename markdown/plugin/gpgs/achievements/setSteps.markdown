# achievements.setSteps()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, achievements, setSteps
> __See also__          [gpgs.achievements][plugin.gpgs.achievements]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets an incremental achievement to the specified amount of steps.

## Syntax

	gpgs.achievements.setSteps( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### achievementId ~^(required)^~
_[String][api.type.String]._ Achievement to update.

##### steps ~^(required)^~
_[Number][api.type.Number]._ Amount of steps for the achievement.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [setSteps][plugin.gpgs.achievements.event.setSteps] event.