
# audio.freeChannels

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Number][api.type.Number]
> __Library__           [audio.*][api.library.audio]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, channels, free channels
> __See also__          [audio.findFreeChannel()][api.library.audio.findFreeChannel]
>								[audio.play()][api.library.audio.play]
>								[audio.reserveChannels()][api.library.audio.reserveChannels]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This property is equal to the number of channels that are currently available for playback (channels not playing or paused).

## Syntax

	audio.freeChannels


## Example

`````lua
local result = audio.freeChannels
print( result )
`````
