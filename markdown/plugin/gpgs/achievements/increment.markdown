# achievements.increment()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, achievements, increment
> __See also__          [gpgs.achievements][plugin.gpgs.achievements]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Increments an incremental achievement by the specified amount of steps.

## Syntax

	gpgs.achievements.increment( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### achievementId ~^(required)^~
_[String][api.type.String]._ Achievement to increment.

##### steps ~^(optional)^~
_[Number][api.type.Number]._ Incremental value. Default is `1`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives an [increment][plugin.gpgs.achievements.event.increment] event.