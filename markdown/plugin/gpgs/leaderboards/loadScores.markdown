# leaderboards.loadScores()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, leaderboards, loadScores
> __See also__          [gpgs.leaderboards][plugin.gpgs.leaderboards]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Retrieves scores from a specified leaderboard.

## Syntax

	gpgs.leaderboards.loadScores( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### leaderboardId ~^(required)^~
_[String][api.type.String]._ Leaderboard ID from which to load scores.

##### position ~^(optional)^~
_[String][api.type.String]._ One of the following values:

* `"top"` &mdash; the top scores (default).
* `"single"` &mdash; the current player's score.
* `"centered"` &mdash; scores around the current player's score.

##### friendsOnly ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, loads only scores for the current player's friends.

##### limit ~^(optional)^~
_[Number][api.type.Number]._ Number of scores to load. The maximum and default is `25`.

##### timeSpan ~^(optional)^~
_[String][api.type.String]._ One of the following values:

* `"all time"` &mdash; all scores (default).
* `"weekly"` &mdash; scores from the week.
* `"daily"` &mdash; scores from the day.

##### reload ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`, the data will be retrieved fresh, not from a cache.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [loadScores][plugin.gpgs.leaderboards.event.loadScores] event.
