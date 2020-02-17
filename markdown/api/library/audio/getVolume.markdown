
# audio.getVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, volume
> __See also__          [audio.setVolume()][api.library.audio.setVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Gets the volume for a specific channel, or gets the master volume.

This function returns:

* The channel volume if requesting a specific channel.
* The master volume if no parameters are given.
* The average volume across all channels if `{ channel=0 }` is specified.

## Gotchas

Note that the master volume is not necessarily the device's ringer volume. However, all volumes are scaled proportionally to the ringer volume.


## Syntax

	audio.getVolume( { channel=c } )

##### channel ~^(optional)^~
_[Number][api.type.Number]._ The channel number you want to get the volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specifying `0` will return the average volume across all channels. Omitting this parameter entirely gets the master volume which is different than the channel volume. All channel volumes are scaled by the master volume.

## Example

`````lua
local masterVolume = audio.getVolume()  -- get the master volume
local channel1Volume = audio.getVolume( { channel=1 } ) -- get the volume on channel 1
`````
