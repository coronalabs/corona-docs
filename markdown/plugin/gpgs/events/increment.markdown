# events.increment()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, events, increment
> __See also__          [gpgs.events][plugin.gpgs.events]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Increments an event value.

## Syntax

	gpgs.events.increment( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### eventId ~^(required)^~
_[String][api.type.String]._ Event to increment.

##### steps ~^(optional)^~
_[Number][api.type.Number]._ Incremental value. Default is `1`.