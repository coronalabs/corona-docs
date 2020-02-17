
# audio.setVolume()

> --------------------- ------------------------------------------------------------------------------------------
> __Type__              [Function][api.type.Function]
> __Library__           [audio.*][api.library.audio]
> __Return value__      [Boolean][api.type.Boolean]
> __Revision__          [REVISION_LABEL](REVISION_URL)
> __Keywords__          audio, volume, set volume
> __See also__          [audio.getVolume()][api.library.audio.getVolume]
>								[audio.play()][api.library.audio.play]
> --------------------- ------------------------------------------------------------------------------------------


## Overview

Sets the volume either for a specific channel, or sets the master volume.

This function returns `true` on success, or `false` on failure.

## Gotchas

Note that the master volume is not necessarily the device's ringer volume. However, all volumes are scaled proportionally to the ringer volume.

When you set the volume, that new volume level is persistent until you set it again. Particularly with channels, you should always keep this in mind. If you change the volume, say on channel 1, channel 1 will continue to stay set at that level even if the sound finishes playing on that channel and you start playing a new sound on that channel.

If you are playing audio with auto-assigned channels, please understand that if you had previously changed the volume on the channel you are auto-assigned, the volume will play at that level for your new sound. For defensive programming, you may consider using manual channel assignment for channels you intend to change the volume for and use the [audio.reserveChannels()][api.library.audio.reserveChannels] API to prevent those channels from being auto-assigned.

## Syntax
	
	audio.setVolume( volume [, options ] )

##### volume ~^(required)^~
_[Number][api.type.Number]._ The new volume level you want to apply. Valid numbers range from `0.0` to `1.0`, where `1.0` is the maximum value.

##### options ~^(required)^~
_[Table][api.type.Table]._ Table that supports a single key, `channel`, which is the channel number you want to set the volume on. Valid channels are `1` to the maximum number of channels (currently&nbsp;32). Specify `0` to apply the volume to all channels. Omitting this parameter entirely sets the master volume which is different than the channel volume. All channel volumes are scaled by the master volume.


## Example

`````lua
audio.setVolume( 0.5 )  -- set the master volume
audio.setVolume( 0.75, { channel=1 } ) -- set the volume on channel 1
`````
