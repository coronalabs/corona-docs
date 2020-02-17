
# audio.findFreeChannel()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, channels, free channels
> __See also__          [audio.play()][api.library.audio.play]
>								[audio.reserveChannels()][api.library.audio.reserveChannels]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Looks for an available audio channel for playback. You can provide a start channel number as parameter and begin searching from that channel, increasing upward to the highest channel. The search does not include reserved channels.

This function returns the channel number of an available channel or `0` if none could be found.

## Syntax

	audio.findFreeChannel( [ startChannel ] )

##### startChannel ~^(optional)^~
_[Number][api.type.Number]._ The channel number you want to start looking at. Search will increase upwards from this channel. `0` or no parameter begins searching at the lowest possible value.


## Example

`````lua
local availableChannel = audio.findFreeChannel()
audio.play( laserSound, { channel=availableChannel } )
`````
