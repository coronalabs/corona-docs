# leaderboards.submit()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Return value__      none
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, leaderboards, submit
> __See also__          [gpgs.leaderboards][plugin.gpgs.leaderboards]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Submits a score to a specific leaderboard.

## Syntax

	gpgs.leaderboards.submit( params )

##### params ~^(required)^~
_[Table][api.type.Table]._ Contains parameters for the call &mdash; see the next section for details.

## Parameter Reference

The `params` table contains parameters for the call.

##### leaderboardId ~^(required)^~
_[String][api.type.String]._ Leaderboard ID to submit to.

##### score ~^(required)^~
_[Number][api.type.Number]._ The score value.

##### tag ~^(optional)^~
_[String][api.type.String]._ Optional additional info. Must be <nobr>URL-encoded</nobr> and a maximum size of 64&nbsp;bytes.

##### listener ~^(optional)^~
_[Listener][api.type.Listener]._ Listener function which receives a [submit][plugin.gpgs.leaderboards.event.submit] event.
