# object.endTimestamp

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Quest, endTimestamp
> __See also__          [Quest][plugin.gpgs.quests.type.Quest]
>						[gpgs.quests][plugin.gpgs.quests]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[String][api.type.String] representing the timestamp, in milliseconds since Unix epoch, at which this quest will change to the `"expired"` state if not accepted, or change to the `"failed"` state if accepted but not completed. Can be `nil`.