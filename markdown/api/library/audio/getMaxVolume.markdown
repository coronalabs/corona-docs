
# audio.getMaxVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, volume, max volume
> __See also__          [audio.getVolume()][api.library.audio.getVolume]
>								[audio.setMaxVolume()][api.library.audio.setMaxVolume]
>								[audio.setVolume()][api.library.audio.setVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the max volume for a specific channel. There is no max volume for the master volume.

This function returns the channel max volume if requesting a channel, or the average max volume across all channels if `{ channel=0 }` is specified.

## Syntax

	audio.getMaxVolume( { channel=c } )

##### channel ~^(optional)^~
_[Number][api.type.Number]._ The channel number you want to get the max volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specifying `0` will return the average volume across all channels.


## Example

`````lua
local channel1MaxVolume = audio.getMaxVolume( { channel=1 } ) 
`````