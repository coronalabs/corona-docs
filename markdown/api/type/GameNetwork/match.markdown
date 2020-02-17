# gameNetwork.match

> --------------------- ------------------------------------------------------------------------------------------
> __Library__           [gameNetwork.*][api.library.gameNetwork]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Game Center, match
> __See also__				[gameNetwork.request()][plugin.gameNetwork-apple.request]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

A match object returned from [gameNetwork.request()][plugin.gameNetwork-apple.request].

## Properties

* `matchID` ([string][api.type.String])
* `data` ([string][api.type.String])
* `participants` (array of [participant][api.type.GameNetwork.participant] objects)
* `currentParticipant` ([participant][api.type.GameNetwork.participant] object)
* `status` ([string][api.type.String])

## Status Values

The following are possible values for `status`:

* `unknown` &mdash; The match is in an unexpected state.
* `open` &mdash; The match is currently being played.
* `ended` &mdash; The match has been completed.
* `matching` &mdash; Game Center is searching for other players to join the match.