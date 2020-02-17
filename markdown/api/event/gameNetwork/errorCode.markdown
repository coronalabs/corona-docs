
# event.errorCode

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Event__             [gameNetwork][api.event.gameNetwork]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          gameNetwork, Game Center, errorCode
> __See also__				[event.errorMessage][api.event.gameNetwork.errorMessage]
> --------------------- ------------------------------------------------------------------------------------------

## Overview

If an error occurs, this will be set with an integer returning the error code of the error. If there is no error, this field is `nil`.

## Gotchas

On iOS and Mac, this is the error code returned by Apple. See [event.errorMessage][api.event.gameNetwork.errorMessage] for a human-readable string that describes the error.

