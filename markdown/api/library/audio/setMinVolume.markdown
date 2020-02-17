
# audio.setMinVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, volume, min volume, set minimum, sound
> __See also__          [audio.getMinVolume()][api.library.audio.getMinVolume]
>								[audio.setMaxVolume()][api.library.audio.setMaxVolume]
>								[audio.getMaxVolume()][api.library.audio.getMaxVolume]
>								[audio.getVolume()][api.library.audio.getVolume]
>								[audio.setVolume()][api.library.audio.setVolume]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Clamps the minimum volume to the set value. Any volumes that fall below the value will be played at the minimum volume level.

This function returns `true` on success or `false` if otherwise.

## Gotchas

There is no max volume for the master volume.

## Syntax
	
	audio.setMinVolume( volume, options )

##### volume ~^(required)^~
_[Number][api.type.Number]._ The new min volume level you want to apply. Valid numbers range from `0.0` to `1.0`, where `1.0` is the maximum value.

##### options ~^(required)^~
_[Table][api.type.Table]._ Table that supports a single key, `channel`, which is the channel number you want to set the minimum volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specify `0` to apply the minimum volume to all channels.


## Example

`````lua
audio.setMinVolume( 0.25, { channel=1 } )
`````
