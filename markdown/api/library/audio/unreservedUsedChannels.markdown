
# audio.unreservedUsedChannels

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [audio.*][api.library.audio]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, channels, unreserved used channels
> __See also__          [audio.unreservedFreeChannels][api.library.audio.unreservedUsedChannels]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the number of channels that are currently in use (playing or paused), excluding the channels which have been reserved.


## Syntax

	audio.unreservedUsedChannels


## Example

`````lua
local result = audio.unreservedUsedChannels
print( result )
`````
