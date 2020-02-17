
# audio.unreservedFreeChannels

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [audio.*][api.library.audio]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, channels, unreserved free channels
> __See also__          [audio.unreservedUsedChannels][api.library.audio.unreservedUsedChannels]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Returns the number of channels that are currently available for playback (channels not playing or paused), excluding the channels which have been reserved.

## Syntax

	audio.unreservedFreeChannels


## Example

`````lua
local result = audio.unreservedFreeChannels
print( result )
`````
