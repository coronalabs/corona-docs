
# audio.getMinVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, volume, max volume
> __See also__          [audio.getMaxVolume()][api.library.audio.getMaxVolume]
>								[audio.setMaxVolume()][api.library.audio.setMaxVolume]
>								[audio.setVolume()][api.library.audio.setVolume]
>								[audio.getVolume()][api.library.audio.getVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the minimum volume for a specific channel. There is no minimum volume for the master volume.

This function returns the channel minimum volume if requesting a channel volume, or the average minimum volume across all channels if `{ channel=0 }` is specified.


## Syntax

	audio.getMinVolume( { channel=c } )

##### channel ~^(optional)^~
_[Number][api.type.Number]._ The channel number you want to get the minimum volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specifying `0` will return the average volume across all channels.


## Example

`````lua
local channel1MinVolume = audio.getMinVolume( { channel=1 } )
`````
