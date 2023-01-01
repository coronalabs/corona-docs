# event.scores

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Event__             [submit][leaderboards.event.submit]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs.leaderboards.*][plugin.gpgs3.leaderboards]
>                       [gpgs.*][plugin.gpgs3]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

_[Table][api.type.Table]._ Dictionary of Tables - objects representing updated Google Play scores for each time span. Keys are `"daily"`, `"weekly"`, `"all time"`. Each table contains following properties:

##### score ~^(optional)^~
_[String][api.type.String]._ Submitted score value.

##### formattedScore ~^(optional)^~
_[String][api.type.String]._ String containing the score data in a display-appropriate format.

##### isNewBest ~^(optional)^~
_[Boolean][api.type.Boolean]._ Indicates whether or not this score was the player's new best score for this time span.

##### tag ~^(optional)^~
_[String][api.type.String]._ The score tag associated with this result, if any. Can be `nil`.