# leaderboards.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, leaderboards, show
> __See also__          [gpgs.leaderboards][plugin.gpgs.leaderboards]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Shows a specific leaderboard, or all leaderboards.

## Syntax

	gpgs.leaderboards.show( params )

##### params ~^(optional)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### leaderboardId ~^(optional)^~
_[String][api.type.String]._ If provided, shows only this leaderboard. If omitted, all leaderboards will be shown.

##### friendsOnly ~^(optional)^~
_[Boolean][api.type.Boolean]._ Supported only on Android; if `true`, shows only the scores for the current player's friends.

##### timeSpan ~^(optional)^~
_[String][api.type.String]._ One of the following values:

* `"all time"` &mdash; shows all scores (default).
* `"weekly"` &mdash; shows scores from the week.
* `"daily"` &mdash; shows scores from the day.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [show][plugin.gpgs.leaderboards.event.show] event.
