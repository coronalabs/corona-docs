
# audio.setMaxVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, volume, max volume, set maximum, sound
> __See also__          [audio.setMinVolume()][api.library.audio.setMinVolume]
>								[audio.getVolume()][api.library.audio.getVolume]
>								[audio.setVolume()][api.library.audio.setVolume]
>								[audio.getMaxVolume()][api.library.audio.getMaxVolume]
>								[audio.setMinVolume()][api.library.audio.setMinVolume]
>								[audio.getMinVolume()][api.library.audio.getMinVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Clamps the maximum volume to the set value. Any volumes that exceed the value will be played at the maximum volume level.

This function returns `true` on success or `false` if otherwise.

## Gotchas

There is no max volume for the master volume.

## Syntax
	
	audio.setMaxVolume( volume, options )

##### volume ~^(required)^~
_[Number][api.type.Number]._ The new max volume level you want to apply. Valid numbers range from `0.0` to `1.0`, where `1.0` is the maximum value.

##### options ~^(required)^~
_[Table][api.type.Table]._ Table that supports a single key, `channel`, which is the channel number you want to set the max volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specify `0` to apply the max volume to all channels.


## Example

`````lua
audio.setMaxVolume( 0.75, { channel=1 } )
`````
