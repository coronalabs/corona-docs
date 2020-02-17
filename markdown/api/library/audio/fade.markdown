
# audio.fade()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, fade
> __See also__          [audio.fadeOut()][api.library.audio.fadeOut]
>								[audio.play()][api.library.audio.play]
>								[audio.setVolume()][api.library.audio.setVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This fades a playing sound in a specified amount to a specified volume. The audio will continue playing after the fade completes.

This function returns the number of channels fade is actually applied to.

## Gotchas

When you fade the volume, you are changing the volume of the channel. This value is persistent and it's your responsibility to reset the volume on the channel if you want to use the channel again later (see [audio.setVolume()][api.library.audio.setVolume]).

## Syntax

	audio.fade( [ { [channel=c] [, time=t] [, volume=v ] } ] )

This function takes a single table as a parameter, with the following optional keys:

##### channel ~^(optional)^~
_[Number][api.type.Number]._ The channel number you want to fade on. `1` to the maximum number of channels are valid channels. Specify `0` to apply fade to all channels.

##### time ~^(optional)^~
_[Number][api.type.Number]._ The amount of time (in milliseconds) over which you want the audio to fade. Omitting this parameter invokes a default fade time which is currently 1000 milliseconds.

##### volume ~^(optional)^~
_[Number][api.type.Number]._ The target volume you want to change (fade) to. Valid numbers are `0.0` to `1.0` where `1.0` is the max volume. If this parameter is omitted, the default value is currently `0.0`.


## Example

`````lua
audio.fade( { channel=1, time=5000, volume=0.5 } )
`````
