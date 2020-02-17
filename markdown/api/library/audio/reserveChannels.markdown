
# audio.reserveChannels()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Number][api.type.Number]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, reserve, channels
> __See also__          [audio.play()][api.library.audio.play]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Allows you to reserve a certain number of channels so they won't be automatically assigned to play on. This function blocks off the lower number channels up to the number you specify so they won't be automatically assigned to be played on when you call various play functions.

For example, if there are 32 channels available, and you pass `2` into this function, channels 1 and 2 will be reserved so they won't be played on automatically when you specify you want to play a sound on any available channel. You can still play on channels 1 and 2 if you explicitly designate you want to play on their channel number. This can be useful if you always want your music to be on channel 1 and speech on channel 2 and you don't want sound effects to ever occupy those channels. This allows you to build in certain assumptions about your code, perhaps for example, having different volume levels for music, speech, and sound effects.

Setting this back to `0` will clear all the reserved channels so all will be available again for auto-assignment. Specifying the number of reserve channels to the maximum number of channels will effectively disable auto-assignment.

This function returns the number of currently reserved channels.

## Syntax

	audio.reserveChannels( channels )

##### channels ~^(required)^~
_[Number][api.type.Number]._ The number of channels you want to reserve. `0` will un-reserve all channels.


## Example

`````lua
audio.reserveChannels( 2 )
`````
