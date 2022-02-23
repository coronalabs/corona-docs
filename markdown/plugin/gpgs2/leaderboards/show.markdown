# gpgs.leaderboards.show()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.leaderboards.*][plugin.gpgs2.leaderboards]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Shows leaderboards. Can show a specific one.

## Syntax

	gpgs.leaderboards.show(params)

##### params ~^(optional)^~
_[Table][api.type.Table]._ Contains parameters — see the next section for details.

## Parameter Reference

##### leaderboardId ~^(optional)^~
_[String][api.type.String]._ If provided, that particular leaderboard is shown.

##### friendsOnly ~^(optional)^~
_[Boolean][api.type.Boolean]._ If `true`. show only scores for the current player's friends.

##### timeSpan ~^(optional)^~
_[String][api.type.String]._ Can be one of these: `"all time"`, `"weekly"` - scores are reset each week, `"daily"` - scores are reset daily. Default is `"all time"`.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Receives [show][plugin.gpgs2.leaderboards.event.show] event.