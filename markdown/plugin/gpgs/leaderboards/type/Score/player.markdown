# object.player

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Table][api.type.Table]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs, Score, player
> __See also__          [gpgs.leaderboards][plugin.gpgs.leaderboards]
>                       [gpgs.*][plugin.gpgs]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

Either a [Player][plugin.gpgs.players.type.Player] object or, if the current player is not authorized to see information about the holder of this score, a [table][api.type.Table] containing the following properties:

* `name` &mdash; [String][api.type.String] representing the display name of the player. If the identity of the player is unknown, this will return an anonymous name to display.

* `largeImageUri` &mdash; [String][api.type.String] representing the URI of the <nobr>hi-res</nobr> image to display for the player who scored this score. If the identity of the player is unknown, this will return `nil`. It may also be `nil` if the player has no image.

* `smallImageUri` &mdash; [String][api.type.String] representing the URI of the icon image to display for the player who scored this score. If the identity of the player is unknown, this will return `nil`. It may also be `nil` if the player has no image.
