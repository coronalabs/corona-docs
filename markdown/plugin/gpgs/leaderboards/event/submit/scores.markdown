# event.scores

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Array][api.type.Array]
> __Event__             [submit][plugin.gpgs.leaderboards.event.submit]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, submit, scores
> __See also__          [submit][plugin.gpgs.leaderboards.event.submit]
>						[gpgs.leaderboards][plugin.gpgs.leaderboards]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

[Array][api.type.Array] of <nobr>key-value</nobr> pairs representing updated Google&nbsp;Play scores for each timespan. Keys include `"daily"`, `"weekly"`, and <nobr>`"all time"`</nobr>, and the value of each key is a [table][api.type.Table] containing the following properties:

* `score` &mdash; [String][api.type.String] value for the submitted score.
* `formattedScore` &mdash; [String][api.type.String] value representing the score data in a <nobr>display-appropriate</nobr> format.
* `isNewBest` &mdash; [Boolean][api.type.Boolean] value indicating whether or not this score is the player's new best score for the timespan.
* `tag` &mdash; [String][api.type.String] value representing the score tag associated with this result, if any. Can be `nil`.