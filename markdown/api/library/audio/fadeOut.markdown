
# audio.fadeOut()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, fade, fade out
> __See also__          [audio.fade()][api.library.audio.fade]
>								[audio.play()][api.library.audio.play]
>								[audio.setVolume()][api.library.audio.setVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

This stops a playing sound in a specified amount of time and fades to min volume while doing it. The audio will stop at the end of the time and the channel will be freed.

This function returns the number of channels `audio.fadeOut()` is actually applied to.

## Gotchas

When you fade the volume, you are changing the volume of the channel. This value is persistent and it's your responsibility to reset the volume on the channel if you want to use the channel again later (see [audio.setVolume()][api.library.audio.setVolume]).

## Syntax

	audio.fadeOut( [ { [channel=c] [, time=t] } ] )

This function takes a single table as a parameter, with the following optional keys:

##### channel ~^(optional)^~
_[Number][api.type.Number]._ The channel number you want to fadeOut on. `1` to the maximum number of channels are valid channels. Specify `0` to fade out all channels.

##### time ~^(optional)^~
_[Number][api.type.Number]._ The amount of time from now (in milliseconds) that you want the audio to fade out over and stop. Omitting this parameter invokes a default fade out time which is currently 1000 milliseconds.


## Example

`````lua
audio.fadeOut( { channel=1, time=5000 } )
`````
