# object.player

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [String][api.type.String]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          Google Play Games Services, game network, gpgs
> __See also__          [gpgs2.leaderboards.*][plugin.gpgs2.leaderboards]
>                       [gpgs2.*][plugin.gpgs2]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

_[Table][api.type.Table]._ Either a [Player][plugin.gpgs2.players.type.Player] object or if the current player is not authorized to see information about the holder of this score the value will be a Table containing the following properties:

##### name ~^(optional)^~
_[String][api.type.String]._ The display name of the player. If the identity of the player is unknown, this will return an anonymous name to display.

##### largeImageUri ~^(optional)^~
_[String][api.type.String]._ The URI of the hi-res image to display for the player who scored this score. If the identity of the player is unknown, this will return `nil`. It may also be `nil` if the player simply has no image.

##### smallImageUri ~^(optional)^~
_[String][api.type.String]._ The URI of the icon image to display for the player who scored this score. If the identity of the player is unknown, this will return `nil`. It may also be `nil` if the player simply has no image.