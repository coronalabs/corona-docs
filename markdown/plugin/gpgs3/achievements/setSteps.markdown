# gpgs.achievements.setSteps()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.achievements.*][plugin.gpgs3.achievements]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Sets an incremental achievement to the specified amount of steps.

## Syntax

	gpgs.achievements.setSteps(params)

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### achievementId ~^(required)^~
_[String][api.type.String]._ Achievement to update.

##### steps ~^(required)^~
_[Integer][api.type.Number]._ Amount of steps for the achievement.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [setSteps][plugin.gpgs3.achievements.event.setSteps] event.
